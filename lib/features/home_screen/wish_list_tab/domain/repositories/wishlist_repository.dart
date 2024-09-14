import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_add_or_remove_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_response_entity.dart';

abstract class WishlistRepository{
  Future<Either<Failure,WishlistResponseEntity>> getWishlist();
  Future<Either<Failure,WishlistAddOrRemoveResponseEntity>> addToWishList({required String productId});
  Future<Either<Failure,WishlistAddOrRemoveResponseEntity>> removeFromWishlist({required String productId});
}