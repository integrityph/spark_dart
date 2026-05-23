// lib/utils/retry.dart

import 'dart:async';
import 'dart:math';

class RetryConfig {
  final int maxAttempts;
  final int baseDelayMs;
  final int maxDelayMs;
  final num backoffFactor;

  const RetryConfig({
    required this.maxAttempts,
    required this.baseDelayMs,
    required this.maxDelayMs,
    required this.backoffFactor,
  });
}

class RetryContext<T, TData> {
  final int attempt;
  final int maxAttempts;
  final Object
  error; // Dart catches any object, so Object represents the error securely
  final int delayMs;
  final T? result;
  final TData? data;

  RetryContext({
    required this.attempt,
    required this.maxAttempts,
    required this.error,
    required this.delayMs,
    this.result,
    this.data,
  });
}

class RetryCallbacks<T, TData> {
  final FutureOr<TData?> Function(RetryContext<T, TData> context)? fetchData;
  final FutureOr<void> Function(RetryContext<T, TData> context)? onRetry;
  final FutureOr<T?> Function(RetryContext<T, TData> context)? onError;
  final FutureOr<T?> Function(RetryContext<T, TData> context)?
  onMaxAttemptsReached;
  final FutureOr<void> Function()? onStart;

  const RetryCallbacks({
    this.fetchData,
    this.onRetry,
    this.onError,
    this.onMaxAttemptsReached,
    this.onStart,
  });
}

const defaultRetryConfig = RetryConfig(
  maxAttempts: 5,
  baseDelayMs: 1000,
  maxDelayMs: 10000,
  backoffFactor: 2,
);

int _calculateBackoffDelay(int attempt, RetryConfig config) {
  final delay = config.baseDelayMs * pow(config.backoffFactor, attempt - 1);
  return min(delay.toInt(), config.maxDelayMs);
}

class WithRetryOptions<T, TData> {
  final RetryConfig? config;
  final RetryCallbacks<T, TData>? callbacks;

  const WithRetryOptions({this.config, this.callbacks});
}

Future<T> withRetry<T, TData>(
  FutureOr<T> Function(TData? data) operation, {
  WithRetryOptions<T, TData> options = const WithRetryOptions(),
}) async {
  final config = options.config ?? defaultRetryConfig;
  final callbacks = options.callbacks ?? RetryCallbacks<T, TData>();

  if (callbacks.onStart != null) {
    await callbacks.onStart!();
  }

  TData? currentData;

  for (var attempt = 1; attempt <= config.maxAttempts; attempt++) {
    try {
      if (attempt > 1 && callbacks.fetchData != null) {
        final context = RetryContext<T, TData>(
          attempt: attempt,
          maxAttempts: config.maxAttempts,
          error: Exception("Placeholder"),
          delayMs: _calculateBackoffDelay(attempt, config),
          data: currentData,
        );
        currentData = await callbacks.fetchData!(context);
      }

      return await operation(currentData);
    } catch (error) {
      final delayMs = _calculateBackoffDelay(attempt, config);

      final context = RetryContext<T, TData>(
        attempt: attempt,
        maxAttempts: config.maxAttempts,
        error: error,
        delayMs: delayMs,
        data: currentData,
      );

      if (callbacks.onError != null) {
        final result = await callbacks.onError!(context);
        if (result != null) {
          return result;
        }
      }

      if (attempt == config.maxAttempts) {
        if (callbacks.onMaxAttemptsReached != null) {
          final result = await callbacks.onMaxAttemptsReached!(context);
          if (result != null) {
            return result;
          }
        }
        rethrow;
      }

      if (callbacks.onRetry != null) {
        await callbacks.onRetry!(context);
      }

      await Future.delayed(Duration(milliseconds: delayMs));
    }
  }

  throw Exception("Unexpected retry loop exit");
}
