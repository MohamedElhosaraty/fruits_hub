import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  final String uID;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();

  OrderEntity({
    required this.cartEntity,
    required this.uID,
    this.payWithCash,
  });
}
