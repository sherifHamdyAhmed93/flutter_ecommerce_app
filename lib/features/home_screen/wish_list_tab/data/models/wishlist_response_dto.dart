import 'package:flutter_ecommerce_app/features/home_screen/products_tab/data/models/productsResponseDto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/wish_list_tab/domain/entities/wishlist_response_entity.dart';

class WishlistResponseDto extends WishlistResponseEntity {
  WishlistResponseDto({
      super.status,
    super.count,
    super.data,
    super.statusMsg,
    super.message});

  WishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDTO.fromJson(v));
      });
    }
  }

}
