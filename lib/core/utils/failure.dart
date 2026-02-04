import 'package:approachable_geek/core/utils/exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode ${'Error'}: $message';

  @override
  List<dynamic> get props => <dynamic>[message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception) : this(message: exception.message, statusCode: exception.statusCode);
}

class LocalFailure extends Failure {
  const LocalFailure({required super.message, required super.statusCode});

  LocalFailure.fromException(CacheException exception) : this(message: exception.message, statusCode: 505);
}
