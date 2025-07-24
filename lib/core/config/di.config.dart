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

import '../../features/auth/forget_password/api/client/forget_password_api_client.dart'
    as _i597;
import '../../features/auth/forget_password/api/data_source/forget_password_remote_impl.dart'
    as _i868;
import '../../features/auth/forget_password/data/data_source/forget_password_remote.dart'
    as _i936;
import '../../features/auth/forget_password/data/repository/forget_password_repo_ipml.dart'
    as _i550;
import '../../features/auth/forget_password/domain/repository/forget_password_repo.dart'
    as _i604;
import '../../features/auth/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i913;
import '../../features/auth/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i22;
import '../../features/auth/forget_password/domain/use_cases/verify_reset_code_use_case.dart'
    as _i295;
import '../../features/auth/forget_password/presentation/view_model/forget_password_cubit.dart'
    as _i795;
import '../../features/auth/signin/api/client/api_client.dart' as _i13;
import '../../features/auth/signin/api/data_source/signin_remote_impl.dart'
    as _i609;
import '../../features/auth/signin/api/data_source/store_user_token_impl.dart'
    as _i1065;
import '../../features/auth/signin/data/data_source/signin_remote.dart'
    as _i645;
import '../../features/auth/signin/data/data_source/store_user_token.dart'
    as _i718;
import '../../features/auth/signin/data/repository/Signin_repository_impl.dart'
    as _i852;
import '../../features/auth/signin/domain/entities/user_entities.dart' as _i378;
import '../../features/auth/signin/domain/repository/signin_repository.dart'
    as _i828;
import '../../features/auth/signin/domain/use_cases/remember_me_use_case.dart'
    as _i1063;
import '../../features/auth/signin/domain/use_cases/signin_usecase.dart'
    as _i556;
import '../../features/auth/signin/presentation/cubit/sign_in_cubit.dart'
    as _i1007;
import '../../features/auth/signup/api/client/signup_api_client.dart' as _i175;
import '../../features/auth/signup/api/data_source_impl/signup_remote_impl.dart'
    as _i236;
import '../../features/auth/signup/data/data_source/signup_remote.dart'
    as _i602;
import '../../features/auth/signup/data/repo_impl/signup_repo_impl.dart'
    as _i698;
import '../../features/auth/signup/domain/repo/signup_repo.dart' as _i371;
import '../../features/auth/signup/domain/use_case/use_case_signup.dart'
    as _i774;
import '../../features/auth/signup/presentation/view_model/cubit/signup_cubit.dart'
    as _i507;
import '../local_data/user_cash_token.dart' as _i732;
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
    gh.factory<_i732.UserCashToken>(() => _i732.UserCashToken());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.pref,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i718.StoreUserToken>(() => _i1065.StoreUserTokenImpl());
    gh.lazySingleton<_i597.ForgetPasswordApiClient>(
      () => _i597.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i13.ApiClient>(() => _i13.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i175.SignupApiClient>(
      () => _i175.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i602.SignupRemote>(
      () =>
          _i236.SignupRemoteImpl(signupApiClient: gh<_i175.SignupApiClient>()),
    );
    gh.lazySingleton<_i645.SigninRemote>(
      () => _i609.SigninRemoteImpl(apiClient: gh<_i13.ApiClient>()),
    );
    gh.lazySingleton<_i371.SignupRepo>(
      () => _i698.SignupRepoImpl(signupRemote: gh<_i602.SignupRemote>()),
    );
    gh.factory<_i378.UserEntities>(
      () => _i378.UserEntities(token: gh<String>()),
    );
    gh.lazySingleton<_i936.ForgetPasswordRemote>(
      () => _i868.ForgetPasswordRemoteImpl(
        forgetPasswordApiClient: gh<_i597.ForgetPasswordApiClient>(),
      ),
    );
    gh.lazySingleton<_i828.SigninRepository>(
      () => _i852.SigninRepositoryImpl(
        signinRemote: gh<_i645.SigninRemote>(),
        storeUserToken: gh<_i718.StoreUserToken>(),
      ),
    );
    gh.lazySingleton<_i1063.RememberMeUseCase>(
      () => _i1063.RememberMeUseCase(
        signinRepository: gh<_i828.SigninRepository>(),
      ),
    );
    gh.factory<_i774.UseCaseSignup>(
      () => _i774.UseCaseSignup(signupRepo: gh<_i371.SignupRepo>()),
    );
    gh.lazySingleton<_i556.SigninUseCase>(
      () => _i556.SigninUseCase(repository: gh<_i828.SigninRepository>()),
    );
    gh.factory<_i507.SignupCubit>(
      () => _i507.SignupCubit(gh<_i774.UseCaseSignup>()),
    );
    gh.factory<_i1007.SignInCubit>(
      () => _i1007.SignInCubit(
        signInUseCase: gh<_i556.SigninUseCase>(),
        rememberMeUseCase: gh<_i1063.RememberMeUseCase>(),
      ),
    );
    gh.lazySingleton<_i604.ForgetPasswordRepo>(
      () => _i550.ForgetPasswordRepoImpl(gh<_i936.ForgetPasswordRemote>()),
    );
    gh.factory<_i913.ForgetPasswordUseCase>(
      () => _i913.ForgetPasswordUseCase(
        forgetPasswordRepo: gh<_i604.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i22.ResetPasswordUseCase>(
      () => _i22.ResetPasswordUseCase(
        forgetPasswordRepo: gh<_i604.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i295.VerifyResetCodeUseCase>(
      () => _i295.VerifyResetCodeUseCase(
        forgetPasswordRepo: gh<_i604.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i795.ForgetPasswordCubit>(
      () => _i795.ForgetPasswordCubit(
        gh<_i913.ForgetPasswordUseCase>(),
        gh<_i22.ResetPasswordUseCase>(),
        gh<_i295.VerifyResetCodeUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i585.SharedPreferencesModule {}

class _$DioModule extends _i545.DioModule {}
