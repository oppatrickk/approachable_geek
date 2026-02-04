import 'package:approachable_geek/core/utils/failure.dart';
import 'package:approachable_geek/core/utils/typedef.dart';
import 'package:approachable_geek/features/profile/data/data_sources/profile_datasource_local.dart';
import 'package:approachable_geek/features/profile/domain/entities/profile.dart';
import 'package:approachable_geek/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({
    required this.localDataSource,
  });

  final ProfileDataSourceLocal localDataSource;

  @override
  Future<Profile?> getUserProfile() async {
    try {
      final model = await localDataSource.getUserProfile();

      return switch (model) {
        final m => Profile(
          uid: m.uid,
          firstName: m.firstName,
          lastName: m.lastName,
          email: m.email,
          phone: m.phone,
          about: m.about,
          photo: m.photo,
        ),
      };
    } catch (e) {
      rethrow;
    }
  }

  @override
  ResultFuture<void> updateUserProfile({required Profile profile}) async {
    try {
      await localDataSource.updateUserProfile(profile);

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure(message: e.toString(), statusCode: 505),
      );
    }
  }
}
