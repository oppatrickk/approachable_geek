// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../features/profile/data/data_sources/profile_datasource_local.dart'
    as _i193;
import '../features/profile/data/repositories/profile_repository_impl.dart'
    as _i13;
import '../features/profile/domain/repositories/profile_repository.dart'
    as _i386;
import '../features/profile/domain/usecases/get_profile_usecase.dart' as _i168;
import '../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i586;
import '../features/profile/presentation/blocs/profile_bloc.dart' as _i691;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => injectionModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i193.ProfileDataSourceLocal>(
      () => _i193.ProfileDataSourceLocalImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i386.ProfileRepository>(
      () => _i13.ProfileRepositoryImpl(
        localDataSource: gh<_i193.ProfileDataSourceLocal>(),
      ),
    );
    gh.lazySingleton<_i168.GetUserProfile>(
      () => _i168.GetUserProfile(gh<_i386.ProfileRepository>()),
    );
    gh.lazySingleton<_i586.UpdateUserProfile>(
      () => _i586.UpdateUserProfile(gh<_i386.ProfileRepository>()),
    );
    gh.factory<_i691.ProfileBloc>(
      () => _i691.ProfileBloc(
        gh<_i168.GetUserProfile>(),
        gh<_i586.UpdateUserProfile>(),
      ),
    );
    return this;
  }
}

class _$InjectionModule extends _i464.InjectionModule {}
