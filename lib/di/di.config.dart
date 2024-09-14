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
import '../features/home_screen/home_tab/data/data_sources/home_tab_remote_data_source.dart'
    as _i456;
import '../features/home_screen/home_tab/data/data_sources/home_tab_remote_data_source_impl.dart'
    as _i822;
import '../features/home_screen/home_tab/data/repositories/home_tab_repository_impl.dart'
    as _i91;
import '../features/home_screen/home_tab/domain/repositories/home_tab_repository.dart'
    as _i94;
import '../features/home_screen/home_tab/domain/use_cases/home_brands_usecase.dart'
    as _i318;
import '../features/home_screen/home_tab/domain/use_cases/home_categories_usecase.dart'
    as _i1002;
import '../features/home_screen/home_tab/presentation/manager/home_tab_brands_view_model_cubit.dart'
    as _i583;
import '../features/home_screen/home_tab/presentation/manager/home_tab_categories_view_model_cubit.dart'
    as _i877;
import '../features/home_screen/product_details_screen/data/data_sources/product_remote_data_source.dart'
    as _i722;
import '../features/home_screen/product_details_screen/data/data_sources/product_remote_data_source_impl.dart'
    as _i492;
import '../features/home_screen/product_details_screen/data/repositories/product_repository_impl.dart'
    as _i963;
import '../features/home_screen/product_details_screen/domain/repositories/product_repository.dart'
    as _i54;
import '../features/home_screen/product_details_screen/domain/use_cases/product_use_case.dart'
    as _i427;
import '../features/home_screen/product_details_screen/presentation/manager/product_view_model_cubit.dart'
    as _i809;
import '../features/home_screen/products_tab/data/data_sources/products_remote_data_source.dart'
    as _i912;
import '../features/home_screen/products_tab/data/data_sources/products_remote_data_source_impl.dart'
    as _i1061;
import '../features/home_screen/products_tab/data/repositories/products_repository_impl.dart'
    as _i1009;
import '../features/home_screen/products_tab/domain/repositories/products_tab_repository.dart'
    as _i779;
import '../features/home_screen/products_tab/domain/use_cases/products_usecase.dart'
    as _i353;
import '../features/home_screen/products_tab/presentation/manager/products_view_model_cubit.dart'
    as _i221;
import '../features/home_screen/wish_list_tab/data/data_sources/wishlist_remote_data_source.dart'
    as _i573;
import '../features/home_screen/wish_list_tab/data/data_sources/wishlist_remote_data_source_impl.dart'
    as _i730;
import '../features/home_screen/wish_list_tab/data/repositories/wishlist_repository_impl.dart'
    as _i881;
import '../features/home_screen/wish_list_tab/domain/repositories/wishlist_repository.dart'
    as _i525;
import '../features/home_screen/wish_list_tab/domain/use_cases/add_to_wishlist_usecase.dart'
    as _i981;
import '../features/home_screen/wish_list_tab/domain/use_cases/remove_from_wishlist_usecase.dart'
    as _i500;
import '../features/home_screen/wish_list_tab/domain/use_cases/wishlist_usecase.dart'
    as _i271;
import '../features/home_screen/wish_list_tab/presentation/manager/wishlist_view_model.dart'
    as _i782;

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
    gh.factory<_i456.HomeTabRemoteDataSource>(() =>
        _i822.HomeTabRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i946.AuthRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i912.ProductsRemoteDataSource>(() =>
        _i1061.ProductsRemoteDataSourceImpl(
            apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i573.WishlistRemoteDataSource>(() =>
        _i730.WishlistRemoteDataSourceImpl(
            apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i722.ProductRemoteDataSource>(() =>
        _i492.ProductRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i94.HomeTabRepository>(() => _i91.HomeTabRepositoryImpl(
        homeTabRemoteDataSource: gh<_i456.HomeTabRemoteDataSource>()));
    gh.factory<_i318.HomeBrandsUseCase>(() => _i318.HomeBrandsUseCase(
        homeTabRepository: gh<_i94.HomeTabRepository>()));
    gh.factory<_i1002.HomeCategoriesUseCase>(() => _i1002.HomeCategoriesUseCase(
        homeTabRepository: gh<_i94.HomeTabRepository>()));
    gh.factory<_i583.HomeTabBrandsViewModelCubit>(() =>
        _i583.HomeTabBrandsViewModelCubit(
            homeBrandsUseCase: gh<_i318.HomeBrandsUseCase>()));
    gh.factory<_i779.ProductsTabRepository>(() => _i1009.ProductsRepositoryImpl(
        productsRemoteDataSource: gh<_i912.ProductsRemoteDataSource>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i54.ProductRepository>(() => _i963.ProductRepositoryImpl(
        productRemoteDataSource: gh<_i722.ProductRemoteDataSource>()));
    gh.factory<_i525.WishlistRepository>(() => _i881.WishlistRepositoryImpl(
        wishlistRemoteDataSource: gh<_i573.WishlistRemoteDataSource>()));
    gh.factory<_i271.WishListUseCase>(() => _i271.WishListUseCase(
        wishlistRepository: gh<_i525.WishlistRepository>()));
    gh.factory<_i500.RemoveFromWishListUseCase>(() =>
        _i500.RemoveFromWishListUseCase(
            wishlistRepository: gh<_i525.WishlistRepository>()));
    gh.factory<_i981.AddToWishListUseCase>(() => _i981.AddToWishListUseCase(
        wishlistRepository: gh<_i525.WishlistRepository>()));
    gh.factory<_i353.ProductsUseCase>(() => _i353.ProductsUseCase(
        productsTabRepository: gh<_i779.ProductsTabRepository>()));
    gh.factory<_i877.HomeTabCategoriesViewModelCubit>(() =>
        _i877.HomeTabCategoriesViewModelCubit(
            homeCategoriesUseCase: gh<_i1002.HomeCategoriesUseCase>()));
    gh.factory<_i782.WishlistViewModel>(() => _i782.WishlistViewModel(
          wishListUseCase: gh<_i271.WishListUseCase>(),
          addToWishListUseCase: gh<_i981.AddToWishListUseCase>(),
          removeFromWishListUseCase: gh<_i500.RemoveFromWishListUseCase>(),
        ));
    gh.factory<_i221.ProductsViewModelCubit>(() => _i221.ProductsViewModelCubit(
        productsUseCase: gh<_i353.ProductsUseCase>()));
    gh.factory<_i224.RegisterUseCase>(() =>
        _i224.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.LoginUseCase>(
        () => _i772.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i427.ProductUseCase>(() =>
        _i427.ProductUseCase(productRepository: gh<_i54.ProductRepository>()));
    gh.factory<_i33.LoginViewModel>(
        () => _i33.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()));
    gh.factory<_i353.SignupViewModel>(() =>
        _i353.SignupViewModel(registerUseCase: gh<_i224.RegisterUseCase>()));
    gh.factory<_i809.ProductViewModel>(() =>
        _i809.ProductViewModel(productUseCase: gh<_i427.ProductUseCase>()));
    return this;
  }
}
