import 'dart:io';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:spark_dart/src/rust/frb_generated.dart';

Future<void> initRustLib() async {
  final externalLibrary = (Platform.isIOS || Platform.isMacOS)
      ? ExternalLibrary.open('rust_lib_spark_dart.framework/rust_lib_spark_dart')
      : null;

  await RustLib.init(externalLibrary: externalLibrary);
}