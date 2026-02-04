import 'package:approachable_geek/core/utils/typedef.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile?> getUserProfile();
  ResultFuture<void> updateUserProfile({required Profile profile});
}
