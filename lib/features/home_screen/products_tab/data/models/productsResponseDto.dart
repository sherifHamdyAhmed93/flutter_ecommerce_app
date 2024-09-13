import 'package:flutter_ecommerce_app/features/home_screen/home_tab/data/models/category_or_brand_response_dto.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';

class ProductsResponseDto extends ProductsResponseEntity {
  ProductsResponseDto({
      super.results,
    super.metadata,
    super.products,});

  ProductsResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetadataDto.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(ProductDTO.fromJson(v));
      });
    }
  }
}

class ProductDTO extends ProductEntity {
  ProductDTO({
      super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
      this.createdAt, 
      this.updatedAt,
    super.id,});

  ProductDTO.fromJson(dynamic json) {
    super.sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryOrBrandeDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? CategoryOrBrandeDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  String? createdAt;
  String? updatedAt;

}


class Subcategory extends SubcategoryEntity {
  Subcategory({
      super.id,
    super.name,
    super.slug,
    super.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
