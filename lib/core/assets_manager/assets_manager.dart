const String imagePath = 'assets/images';

abstract class ImagesAssets{
  static const splashScreen = '$imagePath/splash_screen.png';
  static const logo = '$imagePath/logo.png';
  static const eyeIcon = '$imagePath/eye.png';
}


abstract class TabBarAssets{
  static const homeIcon = '$imagePath/home_tab.png';
  static const homeSelectedIcon = '$imagePath/home_tab_selected.png';

  static const categoryIcon = '$imagePath/category_tab.png';
  static const categorySelectedIcon = '$imagePath/category_tab_selected.png';

  static const profileIcon = '$imagePath/profile_tab.png';
  static const profileSelectedIcon = '$imagePath/profile_tab_selected.png';

  static const favoriteIcon = '$imagePath/favorite_tab.png';
  static const favoriteSelectedIcon = '$imagePath/favorite_tab_selected.png';
}