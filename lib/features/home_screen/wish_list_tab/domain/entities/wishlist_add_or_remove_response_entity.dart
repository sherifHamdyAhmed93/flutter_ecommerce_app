class WishlistAddOrRemoveResponseEntity {
  WishlistAddOrRemoveResponseEntity({
      this.status, 
      this.message, 
      this.data,});

  String? status;
  String? message;
  List<String>? data;
}