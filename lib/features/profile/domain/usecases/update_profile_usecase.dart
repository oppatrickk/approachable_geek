import 'dart:typed_data';

import 'package:approachable_geek/core/utils/typedef.dart';
import 'package:approachable_geek/core/utils/usecase.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserProfile extends UseCase<void, UpdateUserProfileParams> {
  UpdateUserProfile(this._repository);
  final ProfileRepository _repository;

  @override
  ResultFuture<void> call(UpdateUserProfileParams params) async {
    return _repository.updateUserProfile(
      profile: Profile(
        uid: params.uid,
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        phone: params.phone,
        about: params.about,
        photo: params.photo,
      ),
    );
  }
}

class UpdateUserProfileParams extends Equatable {
  const UpdateUserProfileParams({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.about,
    required this.photo,
  });

  final int uid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String about;
  final Uint8List? photo;

  @override
  List<Object?> get props => <Object?>[
    uid,
    firstName,
    lastName,
    email,
    phone,
    about,
    photo,
  ];
}
