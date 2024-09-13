import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
      this.data,
    this.statusMsg,
    this.message,});

  ProductEntity? data;
  String? statusMsg;
  String? message;
}

