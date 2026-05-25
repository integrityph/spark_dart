import 'package:build_tool/build_tool.dart';

void main(List<String> args) {
  // This routes the CLI commands (like 'gen-key' or 'archive') directly into Cargokit
  runMain(args); 
}
