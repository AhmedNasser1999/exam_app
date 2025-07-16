// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/signup/api/client/signup_api_client.dart' as _i175;
import '../../features/auth/signup/api/data_source_impl/signup_local_impl.dart'
    as _i991;
import '../../features/auth/signup/api/data_source_impl/signup_remote_impl.dart'
    as _i236;
import '../../features/auth/signup/data/data_source/signup_local.dart' as _i79;
import '../../features/auth/signup/data/data_source/signup_remote.dart'
    as _i602;
import '../../features/auth/signup/data/repo_impl/signup_repo_impl.dart'
    as _i698;
import '../../features/auth/signup/domain/repo/signup_repo.dart' as _i371;
import '../../features/auth/signup/domain/use_case/use_case_signup.dart'
    as _i774;
import '../module/dio_module.dart' as _i545;
import '../module/shared_preferences_module.dart' as _i585;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.pref,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i79.SignupLocal>(() => _i991.SignupLocalImpl());
    gh.lazySingleton<_i175.SignupApiClient>(
      () => _i175.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i602.SignupRemote>(
      () =>
          _i236.SignupRemoteImpl(signupApiClient: gh<_i175.SignupApiClient>()),
    );
    gh.factory<_i371.SignupRepo>(
      () => _i698.SignupRepoImpl(
        signupRemote: gh<_i602.SignupRemote>(),
        signupLocal: gh<_i79.SignupLocal>(),
      ),
    );
    gh.lazySingleton<_i774.UseCaseSignup>(
      () => _i774.UseCaseSignup(signupRepo: gh<_i371.SignupRepo>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i585.SharedPreferencesModule {}

class _$DioModule extends _i545.DioModule {}
