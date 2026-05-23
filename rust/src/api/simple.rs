use prost::Message; // Required for the .decode() calls
use std::collections::HashMap;

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

pub fn encrypt_ecies(msg: Vec<u8>, public_key_bytes: Vec<u8>) -> Result<Vec<u8>, String> {
    spark_frost::bridge::encrypt_ecies(&msg, &public_key_bytes)
        .map_err(|e| format!("Encryption failed: {:?}", e))
}

pub fn decrypt_ecies(encrypted_msg: Vec<u8>, private_key_bytes: Vec<u8>) -> Result<Vec<u8>, String> {
    spark_frost::bridge::decrypt_ecies(encrypted_msg, private_key_bytes)
        .map_err(|e| format!("Decryption failed: {:?}", e))
}

pub fn sign_frost(
    msg: Vec<u8>,
    key_package_bytes: Vec<u8>,
    nonce_bytes: Vec<u8>,
    self_commitment_bytes: Vec<u8>,
    statechain_commitments_bytes: HashMap<String, Vec<u8>>,
    adaptor_public_key: Option<Vec<u8>>,
) -> Result<Vec<u8>, String> {
    
    // 1. Decode the individual Protobuf objects
    let key_package = spark_frost::proto::frost::KeyPackage::decode(key_package_bytes.as_slice())
        .map_err(|e| format!("Failed to decode KeyPackage: {}", e))?;

    let nonce = spark_frost::proto::frost::SigningNonce::decode(nonce_bytes.as_slice())
        .map_err(|e| format!("Failed to decode SigningNonce: {}", e))?;

    let self_commitment = spark_frost::proto::common::SigningCommitment::decode(self_commitment_bytes.as_slice())
        .map_err(|e| format!("Failed to decode Self Commitment: {}", e))?;

    // 2. Translate the map of bytes into a map of Protobuf structs
    let mut statechain_commitments = HashMap::new();
    for (key, bytes) in statechain_commitments_bytes {
        let commit = spark_frost::proto::common::SigningCommitment::decode(bytes.as_slice())
            .map_err(|e| format!("Failed to decode statechain commitment: {}", e))?;
        statechain_commitments.insert(key, commit);
    }

    // 3. Call their exact bridge function!
    spark_frost::bridge::sign_frost(
        msg,
        key_package,
        nonce,
        self_commitment,
        statechain_commitments,
        adaptor_public_key,
    )
}

pub fn aggregate_frost(
    msg: Vec<u8>,
    statechain_commitments_bytes: HashMap<String, Vec<u8>>,
    self_commitment_bytes: Vec<u8>,
    statechain_signatures: HashMap<String, Vec<u8>>,
    self_signature: Vec<u8>,
    statechain_public_keys: HashMap<String, Vec<u8>>,
    self_public_key: Vec<u8>,
    verifying_key: Vec<u8>,
    adaptor_public_key: Option<Vec<u8>>,
) -> Result<Vec<u8>, String> {
    
    // 1. Decode the single self commitment
    let self_commitment = spark_frost::proto::common::SigningCommitment::decode(self_commitment_bytes.as_slice())
        .map_err(|e| format!("Failed to decode self commitment: {}", e))?;

    // 2. Decode the map of statechain commitments
    let mut statechain_commitments = HashMap::new();
    for (key, bytes) in statechain_commitments_bytes {
        let commit = spark_frost::proto::common::SigningCommitment::decode(bytes.as_slice())
            .map_err(|e| format!("Failed to decode statechain commitment for {}: {}", key, e))?;
        statechain_commitments.insert(key, commit);
    }

    // 3. Pass everything directly to the core bridge function
    spark_frost::bridge::aggregate_frost(
        msg,
        statechain_commitments,
        self_commitment,
        statechain_signatures,
        self_signature,
        statechain_public_keys,
        self_public_key,
        verifying_key,
        adaptor_public_key,
    )
}

// FRB will generate a Dart class with `Uint8List tx` and `String txid`
pub struct DummyTxResult {
    pub tx: Vec<u8>,
    pub txid: String,
}

pub fn create_dummy_tx(address: String, amount_sats: u64) -> Result<DummyTxResult, String> {
    let result = spark_frost::bridge::create_dummy_tx(&address, amount_sats)?;
    
    Ok(DummyTxResult {
        tx: result.tx,
        txid: result.txid,
    })
}

// FRB will generate a Dart class for this
pub struct AdaptorSignatureResult {
    pub part1: Vec<u8>, 
    pub part2: Vec<u8>,
}

pub fn generate_adaptor_from_signature(signature_bytes: Vec<u8>) -> Result<AdaptorSignatureResult, String> {
    // Notice we pass by reference `&signature_bytes` as required by the &[u8] signature
    let (part1, part2) = spark_frost::adaptor_signature::generate_adaptor_from_signature(&signature_bytes)?;
    
    Ok(AdaptorSignatureResult {
        part1,
        part2,
    })
}

pub fn generate_signature_from_existing_adaptor(
    signature_bytes: Vec<u8>,
    adaptor_private_key_bytes: Vec<u8>,
) -> Result<Vec<u8>, String> {
    // Pass references to the core library
    spark_frost::adaptor_signature::generate_signature_from_existing_adaptor(
        &signature_bytes,
        &adaptor_private_key_bytes,
    )
}

pub fn validate_adaptor_signature(
    pub_key: Vec<u8>,
    hash: Vec<u8>,
    signature: Vec<u8>,
    adaptor_pub_key: Vec<u8>,
) -> Result<(), String> {
    spark_frost::adaptor_signature::validate_adaptor_signature(
        &pub_key,
        &hash,
        &signature,
        &adaptor_pub_key,
    )
}

pub fn apply_adaptor_to_signature(
    pub_key: Vec<u8>,
    hash: Vec<u8>,
    signature: Vec<u8>,
    adaptor_private_key: Vec<u8>,
) -> Result<Vec<u8>, String> {
    spark_frost::adaptor_signature::apply_adaptor_to_signature(
        &pub_key,
        &hash,
        &signature,
        &adaptor_private_key,
    )
}

pub struct VerifiableSecretShareResult {
    pub threshold: usize,     // Int 1
    pub index: u32,           // Int 2
    pub share: Vec<u8>,       // 1 byte array
    pub proofs: Vec<Vec<u8>>, // 1 array of byte arrays
}

pub fn split_secret_with_proofs(
    secret: Vec<u8>,
    threshold: usize,
    num_shares: usize,
) -> Result<Vec<VerifiableSecretShareResult>, String> {
    
    // Call the core library
    let shares = spark_frost::vss::split_secret_with_proofs(&secret, threshold, num_shares)?;
    
    // Map the nested core structs into our flat wrapper struct
    let result = shares
        .into_iter()
        .map(|vss| VerifiableSecretShareResult {
            threshold: vss.share.threshold,
            index: vss.share.index,
            share: vss.share.share,
            proofs: vss.proofs,
        })
        .collect();

    Ok(result)
}

// FRB will generate a Dart class for you to pass these values in
pub struct SecretShare {
    pub threshold: usize,
    pub index: u32,
    pub share: Vec<u8>,
}

pub fn recover_secret(shares: Vec<SecretShare>) -> Result<Vec<u8>, String> {
    // Map our FFI structs back into the core library's structs
    let core_shares: Vec<spark_frost::vss::SecretShare> = shares
        .into_iter()
        .map(|s| spark_frost::vss::SecretShare {
            threshold: s.threshold,
            index: s.index,
            share: s.share,
        })
        .collect();

    spark_frost::vss::recover_secret(&core_shares)
}

/// > **⚠️ IMPORTANT:** Index is not zero based. For index 0, use 1.
pub fn validate_share(
    share: Vec<u8>,
    index: u32,
    threshold: usize,
    proofs: Vec<Vec<u8>>,
) -> Result<(), String> {
    
    // &proofs (a reference to a Vec) automatically coerces to a slice &[Vec<u8>]
    spark_frost::vss::validate_share(
        &share,
        index,
        threshold,
        &proofs,
    )
}

pub struct InternalTransactionResult {
    pub tx_bytes: Vec<u8>,
    pub sighash: Vec<u8>,
}

pub struct NodeTxPairResult {
    pub cpfp: InternalTransactionResult,
    pub direct: InternalTransactionResult,
}

pub fn construct_node_tx_pair(
    parent_tx_bytes: Vec<u8>,
    vout: u32,
    address: String,
    sequence: u32,
    direct_sequence: u32,
    fee_sats: u64,
) -> Result<NodeTxPairResult, String> {
    
    // Call the core library with references
    let pair = spark_frost::transaction::construct_node_tx_pair(
        &parent_tx_bytes,
        vout,
        &address,
        sequence,
        direct_sequence,
        fee_sats,
    )?;

    // Map the core results directly to our FRB structs
    Ok(NodeTxPairResult {
        cpfp: InternalTransactionResult {
            tx_bytes: pair.cpfp.tx_bytes,
            sighash: pair.cpfp.sighash,
        },
        direct: InternalTransactionResult {
            tx_bytes: pair.direct.tx_bytes,
            sighash: pair.direct.sighash,
        },
    })
}

// FRB will generate a Dart class with a nullable `direct_refund` field
pub struct RefundTxTrioResult {
    pub cpfp_refund: InternalTransactionResult,
    pub direct_refund: Option<InternalTransactionResult>,
    pub direct_from_cpfp_refund: InternalTransactionResult,
}

pub fn construct_refund_tx_trio(
    cpfp_node_tx_bytes: Vec<u8>,
    direct_node_tx_bytes: Option<Vec<u8>>,
    vout: u32,
    receiving_pubkey: Vec<u8>,
    network: String,
    sequence: u32,
    direct_sequence: u32,
    fee_sats: u64,
) -> Result<RefundTxTrioResult, String> {
    
    // `.as_deref()` magically converts Option<Vec<u8>> into Option<&[u8]>
    let direct_bytes_ref = direct_node_tx_bytes.as_deref();

    // Call the core library
    let trio = spark_frost::transaction::construct_refund_tx_trio(
        &cpfp_node_tx_bytes,
        direct_bytes_ref,
        vout,
        &receiving_pubkey,
        &network,
        sequence,
        direct_sequence,
        fee_sats,
    )?;

    // Map the core results to our FFI-safe struct
    Ok(RefundTxTrioResult {
        cpfp_refund: InternalTransactionResult {
            tx_bytes: trio.cpfp_refund.tx_bytes,
            sighash: trio.cpfp_refund.sighash,
        },
        // .map() safely translates the Option if it exists
        direct_refund: trio.direct_refund.map(|d| InternalTransactionResult {
            tx_bytes: d.tx_bytes,
            sighash: d.sighash,
        }),
        direct_from_cpfp_refund: InternalTransactionResult {
            tx_bytes: trio.direct_from_cpfp_refund.tx_bytes,
            sighash: trio.direct_from_cpfp_refund.sighash,
        },
    })
}

pub fn compute_multi_input_sighash(
    tx_bytes: Vec<u8>,
    input_index: u32,
    prev_out_scripts: Vec<Vec<u8>>,
    prev_out_values: Vec<u64>,
) -> Result<Vec<u8>, String> {
    
    // Pass references to the core library
    // (Adjust `spark_frost::bridge::` if it's in a different module)
    spark_frost::transaction::compute_multi_input_sighash(
        &tx_bytes,
        input_index,
        &prev_out_scripts,
        &prev_out_values,
    )
}