// lib/constants.dart

import 'dart:io' show Platform;

// Note: In a production Dart package, you usually read this from the pubspec.yaml
// during a build step, or pass it via --dart-define. For now, a constant works.
const String packageVersion = "0.1.0";

String _getBaseEnvStr() {
  try {
    // This will work on Android, iOS, macOS, Windows, Linux.
    final os = Platform.operatingSystem;
    final osVersion = Platform.operatingSystemVersion;

    // Platform.version usually looks like "3.3.0 (stable) (Tue Feb 13 10:25:19 2024 ...)"
    // We just want the version number.
    final dartVersion = Platform.version.split(' ').first;

    return 'dart/$dartVersion $os/${osVersion.replaceAll(' ', '-')}';
  } catch (e) {
    // If Platform is accessed on the Web without conditional imports, it throws.
    // We catch it here to safely fallback for Flutter Web instances.
    return 'dart/web unknown/unknown';
  }
}

// We keep this mutable just like the JS version (`let baseEnvStr`),
// in case you want to override it later with specific Flutter app details.
String _baseEnvStr = _getBaseEnvStr();

/// Equivalent to setReactNativeEnvDetails in JS.
/// You can call this during your app's initialization if you want to inject
/// specific Flutter versioning or App versioning.
void setFlutterEnvDetails(String flutterVersion, String os, String osVersion) {
  _baseEnvStr = 'flutter/$flutterVersion $os/$osVersion';
}

/// Returns the formatted environment string sent in API headers
String getClientEnv() {
  return 'dart-spark-sdk/$packageVersion $_baseEnvStr';
}
