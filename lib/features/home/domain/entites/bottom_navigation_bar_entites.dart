import 'package:fruits_hub/generated/assets.dart';

class BottomNavigationBarEntites {
  final String activeImage, inactiveImage;
  final String name;

  BottomNavigationBarEntites(
      {required this.activeImage, required this.inactiveImage,required this.name,});

}

List<BottomNavigationBarEntites> get bottomNavigationBarEntites => [
  BottomNavigationBarEntites(
    activeImage: Assets.outlineHome,
    inactiveImage: Assets.boldHome,
    name : "الرئيسية",
  ),
  BottomNavigationBarEntites(
    activeImage: Assets.outlineProduct,
    inactiveImage: Assets.boldProduct,
    name : "المنتجات",
  ),
  BottomNavigationBarEntites(
    activeImage: Assets.outlineShoppingCart,
    inactiveImage: Assets.boldShoppingCart,
    name : "سلة التسوق",
  ),
  BottomNavigationBarEntites(
    activeImage: Assets.outlineUser,
    inactiveImage: Assets.boldUser,
    name : "حسابي",
  ),
];
