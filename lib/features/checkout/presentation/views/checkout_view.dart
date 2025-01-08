import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widget/custom_app_bar_home.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = 'checkout_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        title: "الشحن",
        showNotification: false,
      ),
      body: CheckoutViewBody(),
    );
  }
}
