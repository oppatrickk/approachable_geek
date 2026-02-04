import 'dart:typed_data';

import 'package:approachable_geek/core/utils/uint8list_coverter.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int uid,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String about,
    @Uint8ListConverter() Uint8List? photo,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  factory ProfileModel.fromEntity(Profile entity) {
    return ProfileModel(
      uid: entity.uid,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phone: entity.phone,
      about: entity.about,
      photo: entity.photo,
    );
  }
}
