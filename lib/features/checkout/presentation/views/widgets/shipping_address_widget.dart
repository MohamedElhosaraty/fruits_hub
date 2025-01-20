import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entites/order_entity.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "عنوان التوصيل",
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesLocation),
          8.horizontalSpace,
          Text(
            "${context.read<OrderEntity>().shippingAddressEntity}",
            style: TextStyles.regular16.copyWith(color: Color(0xff4E5556)),
          ),
          Spacer(),
          SvgPicture.asset(Assets.imagesEditLocation),
          8.horizontalSpace,
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceIn);
            },
            child: Text(
              "تعديل",
              style: TextStyles.semiBold13.copyWith(color: Color(0xFF949D9E)),
            ),
          ),
        ],
      ),
    );
  }
}
