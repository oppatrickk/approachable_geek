import 'dart:async';
import 'dart:convert';

import 'package:approachable_geek/core/utils/failure.dart';
import 'package:approachable_geek/features/profile/data/models/profile_model.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedUserProfile = 'CACHED_USER_PROFILE';

abstract class ProfileDataSourceLocal {
  Future<ProfileModel> getUserProfile();
  Future<void> updateUserProfile(Profile profile);
}

@LazySingleton(as: ProfileDataSourceLocal)
class ProfileDataSourceLocalImpl implements ProfileDataSourceLocal {
  const ProfileDataSourceLocalImpl(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  @override
  Future<ProfileModel> getUserProfile() async {
    final jsonString = _sharedPreferences.getString(cachedUserProfile);

    if (jsonString != null) {
      return ProfileModel.fromJson(json.decode(jsonString) as Map<String, dynamic>);
    } else {
      final assetString = await rootBundle.loadString('assets/data/initial_user.json');
      await _sharedPreferences.setString(cachedUserProfile, assetString);

      return ProfileModel.fromJson(json.decode(assetString) as Map<String, dynamic>);
    }
  }

  @override
  Future<void> updateUserProfile(Profile profile) async {
    try {
      final model = ProfileModel.fromEntity(profile);
      final jsonString = json.encode(model.toJson());

      await _sharedPreferences.setString(cachedUserProfile, jsonString);
    } catch (e) {
      throw ServerFailure(message: e.toString(), statusCode: 505);
    }
  }
}
