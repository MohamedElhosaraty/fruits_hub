import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';

import '../../domain/entites/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String userId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.userId,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
        totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
        userId: orderEntity.uID,
        shippingAddressModel:
            ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
        orderProducts: orderEntity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
            .toList(),
        paymentMethod: orderEntity.payWithCash! ? "cash" : "Paypal");
  }

  toJson() {
    return {
      "totalPrice": totalPrice,
      "userId": userId,
      "shippingAddressModel": shippingAddressModel.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod
    };
  }
}
