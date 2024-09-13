import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';

class CategoryOrBrandResponseDto extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDto({
      super.results,
    super.metadata,
    super.data,});

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? MetadataDto.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandeDto.fromJson(v));
      });
    }
  }

}

class CategoryOrBrandeDto extends CategoryOrBrandEntity {
  CategoryOrBrandeDto({
      super.id,
    super.name,
    super.slug,
    super.image,
      this.createdAt, 
      this.updatedAt,});

  CategoryOrBrandeDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? createdAt;
  String? updatedAt;

}

class MetadataDto extends MetadataEntity {
  MetadataDto({
      super.currentPage,
    super.numberOfPages,
    super.limit,});

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}