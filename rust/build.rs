// rust/build.rs

fn main() {
    // let target_os = std::env::var("CARGO_CFG_TARGET_OS").unwrap_or_default();
    let target = std::env::var("TARGET").unwrap_or_default();
    
    if target.contains("android") && (target.contains("aarch64") || target.contains("x86_64")) {
        println!("cargo:rustc-link-arg=-Wl,-z,max-page-size=16384");
        // This is for normal binaries (ignored by Flutter)
        // println!("cargo:rustc-link-arg=-Wl,-z,max-page-size=16384");
        
        // // THIS IS THE ONE THAT ACTUALLY AFFECTS .so FILES
        // println!("cargo:rustc-cdylib-link-arg=-Wl,-z,max-page-size=16384");
    }
}