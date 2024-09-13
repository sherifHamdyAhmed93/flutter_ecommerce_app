import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';

class ProductsResponseEntity {
  ProductsResponseEntity({
      this.results, 
      this.metadata, 
      this.products,
     this.statusMsg,
     this.message});

  String? message;
  String? statusMsg;
  num? results;
  MetadataEntity? metadata;
  List<ProductEntity>? products;
}

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage,});

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
}

class SubcategoryEntity {
  SubcategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;

}

