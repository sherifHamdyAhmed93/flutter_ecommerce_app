
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/data/data_sources/wishlist_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_add_or_remove_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:WishlistRepository )
class WishlistRepositoryImpl extends WishlistRepository{

  WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImpl({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failure, WishlistAddOrRemoveResponseEntity>> addToWishList({required String productId}) async{
    var either = await  wishlistRemoteDataSource.addToWishList(productId: productId);
    return either.fold(
            (failure)=> Left(failure)
        , (response)=> Right(response) );
  }

  @override
  Future<Either<Failure, WishlistResponseEntity>> getWishlist() async{
    var either = await  wishlistRemoteDataSource.getWishlist();
    return either.fold(
            (failure)=> Left(failure)
        , (response)=> Right(response) );
  }

  @override
  Future<Either<Failure, WishlistAddOrRemoveResponseEntity>> removeFromWishlist({required String productId}) async{
    var either = await  wishlistRemoteDataSource.removeFromWishlist(productId: productId);
    return either.fold(
            (failure)=> Left(failure)
        , (response)=> Right(response) );
  }

}