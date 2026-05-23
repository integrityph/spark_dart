import 'dart:convert';
import 'dart:typed_data';

// TODO: Ensure these imports point to your actual utility/constant files
import '../constants.dart'; // Should export getClientEnv()
import '../utils/hex.dart'; // Should export bytesToHex()

class SparkError implements Exception {
  late Map<String, dynamic> _context;
  final String _initialMessage;
  final Exception? originalError;
  late String message;
  StackTrace? stackTrace;

  SparkError(String initialMessage, [Map<String, dynamic>? contextArg])
    : _initialMessage = initialMessage,
      originalError = _extractError(contextArg) {
    final arg = contextArg ?? {};
    _context = Map<String, dynamic>.from(arg);

    if (_context.containsKey('error')) {
      _context.remove('error');
    }

    // Assuming getClientEnv returns a Map, String, or String-representable object
    _context['clientEnv'] = getClientEnv();

    message = getMessage(_initialMessage, _context, originalError);
    stackTrace = StackTrace.current;
  }

  static Exception? _extractError(Map<String, dynamic>? contextArg) {
    if (contextArg != null && contextArg.containsKey('error')) {
      return getError(contextArg['error']);
    }
    return null;
  }

  void update({String? message, Map<String, dynamic>? context}) {
    if (context != null) {
      _context.addAll(context);
    }
    this.message = getMessage(
      message ?? _initialMessage,
      _context,
      originalError,
    );
  }

  Map<String, dynamic> getContext() {
    return Map.unmodifiable(_context);
  }

  @override
  String toString() {
    return message;
  }

  Map<String, dynamic> toJson() {
    return {
      'name':
          'SparkError', // Dart lacks 'this.constructor.name' without reflection
      'message': message,
      'context': _context,
      'originalError': originalError != null
          ? {
              'name': originalError.runtimeType.toString(),
              'message': originalError.toString(),
              // Dart exceptions don't natively hold stacks unless thrown/caught,
              // but we can pass the runtime representation.
            }
          : null,
      'stack': stackTrace?.toString(),
    };
  }
}

String getMessage(
  String message, [
  Map<String, dynamic>? context,
  Exception? originalError,
]) {
  final ctx = context ?? {};

  final contextStr = ctx.entries
      .map((e) => '${e.key}: ${safeStringify(e.value)}')
      .join(', ');

  // Remove trailing period/exclamation/question mark from message
  final msg = message.replaceAll(RegExp(r'[.!?]+$'), '');

  final originalErrorStr =
      originalError != null && originalError.toString() != message
      ? ': ${originalError.toString()}'
      : '';

  return '$msg$originalErrorStr${contextStr.isNotEmpty ? ' [$contextStr]' : ''}';
}

String safeStringify(dynamic value) {
  if (value is BigInt) {
    return value.toString();
  }

  if (value is Uint8List) {
    return formatUint8Array(value);
  }

  try {
    final result = jsonEncode(
      value,
      toEncodable: (dynamic v) {
        if (v is BigInt) {
          return v.toString();
        }
        if (v is Uint8List) {
          return formatUint8Array(v);
        }
        return v.toString();
      },
    );

    // Remove surrounding quotes if jsonEncode just wrapped a primitive string
    if (result.startsWith('"') && result.endsWith('"')) {
      return result.substring(1, result.length - 1);
    }
    return result;
  } catch (_) {
    try {
      return value.toString();
    } catch (_) {
      return '[Unserializable]';
    }
  }
}

String formatUint8Array(Uint8List arr) {
  return 'Uint8Array(0x${bytesToHex(arr)})';
}

Exception getError(dynamic error) {
  if (error is Exception) {
    return error;
  }

  if (error is Error) {
    // Convert Dart Error (e.g., TypeError) to an Exception wrapper
    return Exception(error.toString());
  }

  if (error != null &&
      error is Map &&
      error.containsKey('message') &&
      error['message'] is String) {
    return Exception(error['message']);
  }

  if (error is String) {
    return Exception(error);
  }

  late String message;

  try {
    message = jsonEncode(error);
  } catch (_) {
    message = error.toString();
  }

  return Exception(message);
}
