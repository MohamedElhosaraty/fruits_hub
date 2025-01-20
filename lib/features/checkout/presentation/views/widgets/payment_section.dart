import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summery_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_address_widget.dart';


class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});

  final PageController pageController ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        const OrderSummeryWidget(),
        16.verticalSpace,
        ShippingAddressWidget(
          pageController: pageController,
        ),
      ],
    );
  }
}
