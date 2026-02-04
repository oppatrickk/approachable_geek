import 'package:approachable_geek/core/utils/uint8list_coverter.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required int uid,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String about,
    @Uint8ListConverter() Uint8List? photo,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
