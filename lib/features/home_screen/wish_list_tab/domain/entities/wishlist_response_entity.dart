import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';

class WishlistResponseEntity {
  WishlistResponseEntity({
      this.status, 
      this.count, 
      this.data,
    this.statusMsg,
    this.message});

  String? message;
  String? statusMsg;
  String? status;
  num? count;
  List<ProductEntity>? data;


}