import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode, this.api});
  final String? api;
  final int statusCode;
  final String message;

  @override
  List<Object?> get props => <Object?>[message, statusCode, api];
}

class CacheException extends Equatable implements Exception {
  const CacheException(this.message);
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
