const _imagePath = "assets/images";
const _navBarImagePath = "$_imagePath/nav_bar";
const _jsonPath = "assets/json";

abstract class AssetsManager {
  static const onBoardingImage = "$_imagePath/onboarding.png";
  static const onBoardingLogo = '$_imagePath/logo.png';
  static const carrotLogo = "$_imagePath/carrot.svg";
  static const groceries = '$_imagePath/groceries.png';
  static const location = '$_imagePath/location.svg';
  static const shop = "$_navBarImagePath/shop.svg";
  static const cart = "$_navBarImagePath/cart.svg";
  static const explore = "$_navBarImagePath/explore.svg";
  static const account = "$_navBarImagePath/account.svg";
  static const search = "$_imagePath/search.svg";
  static const noProductImage = '$_imagePath/no_product.png';
  static const errorJson = '$_jsonPath/error.json';
  static const emptyCartJson = '$_jsonPath/empty_cart.json';
  static const clearIcon = '$_imagePath/clear.svg';
}
