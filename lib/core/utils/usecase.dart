// ignore_for_file: avoid_types_as_parameter_names

import 'package:approachable_geek/core/utils/typedef.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> extends UseCase<Type, NoParams> {
  const UseCaseWithoutParams();

  @override
  ResultFuture<Type> call(NoParams params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
