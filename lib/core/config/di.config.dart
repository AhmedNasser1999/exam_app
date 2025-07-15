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

import '../module/dio_module.dart' as _i545;
import '../module/shared_preferences_module.dart' as _i585;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.pref,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    return this;
  }
}

class _$SharedPreferencesModule extends _i585.SharedPreferencesModule {}

class _$DioModule extends _i545.DioModule {}
