import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserProfile {
  const GetUserProfile(this.repository);
  final ProfileRepository repository;

  Future<Profile> call() async {
    final profile = await repository.getUserProfile();
    return switch (profile) {
      Profile p => p,
      null => throw Exception('User profile not found'),
    };
  }
}
