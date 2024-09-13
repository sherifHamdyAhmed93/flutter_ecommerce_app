import 'package:flutter_ecommerce_app/features/home_screen/product_details_screen/domain/entities/productResponseEntity.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/data/models/productsResponseDto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
      super.statusMsg,
    super.message,
    super.data,});

  ProductResponseDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? ProductDTO.fromJson(json['data']) : null;
  }


}