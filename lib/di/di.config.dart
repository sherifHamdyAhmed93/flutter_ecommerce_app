// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager/api_manager.dart' as _i1000;
import '../data/auth_remote_data_source.dart' as _i45;
import '../data/data_sources/auth_remote_data_source_impl.dart' as _i946;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/register_use_case.dart' as _i224;
import '../features/auth%20screen/sign_in_screen/login_view_model_cubit.dart'
    as _i33;
import '../features/auth%20screen/sign_up_screen/signup_view_model_cubit.dart'
    as _i353;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1000.ApiManager>(() => _i1000.ApiManager());
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i946.AuthRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i224.RegisterUseCase>(() =>
        _i224.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.LoginUseCase>(
        () => _i772.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i33.LoginViewModel>(
        () => _i33.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()));
    gh.factory<_i353.SignupViewModel>(() =>
        _i353.SignupViewModel(registerUseCase: gh<_i224.RegisterUseCase>()));
    return this;
  }
}