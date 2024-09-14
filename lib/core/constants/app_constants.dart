
abstract class Endpoints{
  static const String register = '/api/v1/auth/signup';
  static const String signIn = '/api/v1/auth/signin';

  static const String categories = '/api/v1/categories';
  static const String brands = '/api/v1/brands';
  static const String products = '/api/v1/products';
  static const String productDetails = '/api/v1/products';

  static const String wishlist = '/api/v1/wishlist';
  static const String removeFromWishlist = '/api/v1/wishlist';
  static const String addToWishlist = '/api/v1/wishlist';
}

abstract class ApiConstants {
  static const String baseURL = 'https://ecommerce.routemisr.com';

}

abstract class SharedPreferencesConstants {
  static const String token = 'token';

}