import 'base.dart';

// Note: Dart does not natively support string literal union types extracted from
// object keys (like `keyof SparkServiceDefinition["methods"]`).
// We will use standard `String` types for `operation` and `method`.

/// SparkRequestError should be used failed requests due to server errors or network issues.
/// This includes:
/// - API calls that failed or returned error(s)
/// - Network timeouts
/// - Connection refused
/// - DNS resolution failures
/// - SSL/TLS errors
class SparkRequestError extends SparkError {
  SparkRequestError(
    String message, {
    Map<String, dynamic>? context,
    String? operation,
    String? method, // e.g., "GET" | "POST"
  }) : super(message, _buildContext(context, operation, method));

  static Map<String, dynamic> _buildContext(
    Map<String, dynamic>? context,
    String? operation,
    String? method,
  ) {
    final merged = Map<String, dynamic>.from(context ?? {});
    if (operation != null) merged['operation'] = operation;
    if (method != null) merged['method'] = method;
    return merged;
  }
}

/// SparkValidationError should be used for any errors related to data validation in regards to the user's input,
/// This includes:
/// - Invalid signatures
/// - Malformed addresses
/// - Invalid proof of possession
/// - Invalid cryptographic parameters
/// - Data format validation failures
class SparkValidationError extends SparkError {
  SparkValidationError(String message, {Map<String, dynamic>? context})
    : super(message, context);
}

/// SparkAuthenticationError should be used specifically for authentication and authorization failures,
/// such as invalid credentials or insufficient permissions.
/// This includes:
/// - Invalid API keys
/// - Expired tokens
/// - Insufficient permissions
/// - Authentication token validation failures
/// - Authorization failures
class SparkAuthenticationError extends SparkError {
  SparkAuthenticationError(String message, {Map<String, dynamic>? context})
    : super(message, context);
}

// In Dart, we use `typedef` to create class aliases, which perfectly maps
// to TypeScript's variable reassignment for exports.

@Deprecated('Use SparkValidationError instead.')
typedef ValidationError = SparkValidationError;

@Deprecated('Use SparkRequestError instead.')
typedef NetworkError = SparkRequestError;

@Deprecated('Use SparkAuthenticationError instead.')
typedef AuthenticationError = SparkAuthenticationError;

@Deprecated('Use SparkError instead.')
typedef ConfigurationError = SparkError;

@Deprecated('Use SparkError instead.')
typedef InternalValidationError = SparkError;

@Deprecated('Use SparkRequestError instead.')
typedef RPCError = SparkRequestError;

@Deprecated('Use SparkError instead.')
typedef SparkSdkError = SparkError;
