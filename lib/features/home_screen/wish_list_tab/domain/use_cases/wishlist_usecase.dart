
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/dto/failure.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_response_entity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishListUseCase{

  WishlistRepository wishlistRepository;

  WishListUseCase({required this.wishlistRepository});

  Future<Either<Failure,WishlistResponseEntity>> invoke(){
    return wishlistRepository.getWishlist();
  }

}