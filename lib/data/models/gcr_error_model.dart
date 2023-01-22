import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GCRError extends Equatable {
  final String code;
  final String message;
  final String plugin;
  final StackTrace? stackTrace;

  const GCRError({
    this.code = '',
    this.message = '',
    this.plugin = '',
    this.stackTrace,
  });

  factory GCRError.firebaseException(FirebaseException firebaseException) {
    return GCRError(
      code: firebaseException.code,
      message: firebaseException.message ??
          'FirebaseException: Something went wrong',
      plugin: firebaseException.plugin,
      stackTrace: firebaseException.stackTrace,
    );
  }

  factory GCRError.exception(
    Object exception, {
    StackTrace? stackTrace,
  }) {
    return GCRError(
      code: 'Exception',
      message: exception.toString(),
      plugin: 'flutter_error/server_error',
      stackTrace: stackTrace,
    );
  }

  @override
  List<Object?> get props => [code, message, plugin, stackTrace];

  @override
  String toString() =>
      'GCRError(code: $code, message: $message, plugin: $plugin, stackTrace: $stackTrace)';
}
