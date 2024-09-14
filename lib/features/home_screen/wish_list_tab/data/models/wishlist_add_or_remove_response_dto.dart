import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_add_or_remove_response_entity.dart';

class WishlistAddOrRemoveResponseDto extends WishlistAddOrRemoveResponseEntity {
  WishlistAddOrRemoveResponseDto({
      super.status,
    super.message,
    super.data,});

  WishlistAddOrRemoveResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

}