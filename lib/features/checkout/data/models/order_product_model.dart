import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final double price;
  final String imageUrl;
  final int quantity;

  OrderProductModel(
      {required this.name,
      required this.code,
      required this.price,
      required this.imageUrl,
      required this.quantity});

  factory OrderProductModel.fromEntity(
      {required CartItemEntity cartItemEntity}) {
    return OrderProductModel(
        name: cartItemEntity.productEntity.name,
        code: cartItemEntity.productEntity.code,
        price: cartItemEntity.productEntity.price.toDouble(),
        imageUrl: cartItemEntity.productEntity.imageUrl!,
        quantity: cartItemEntity.count);
  }

  toJson()  {
       return {
         "name": name,
         "code": code,
         "price": price,
         "imageUrl": imageUrl,
         "quantity": quantity
       };
      }
}
