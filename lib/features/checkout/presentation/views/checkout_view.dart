import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widget/custom_app_bar_home.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';


class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout_view';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        title: "الشحن",
        showNotification: false,
      ),
      body: Provider.value(
        value: OrderEntity(cartEntity: cartEntity),
        child: CheckoutViewBody(),
      ),
    );
  }
}
