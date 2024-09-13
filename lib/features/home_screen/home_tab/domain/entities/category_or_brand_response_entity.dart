class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({
      this.results, 
      this.metadata, 
      this.data,this.statusMsg,this.message});

  String? message;
  String? statusMsg;
  num? results;
  MetadataEntity? metadata;
  List<CategoryOrBrandEntity>? data;
}

class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;



}

class MetadataEntity {
  MetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  num? currentPage;
  num? numberOfPages;
  num? limit;
}