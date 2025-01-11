import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderSummeryWidget extends StatelessWidget {
  const OrderSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        title: "ملخص الطلب ",
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "المجموع الفرعي : ",
                  style: TextStyles.regular13.copyWith(
                    color: Color(0xff4E5556),
                  ),
                ),
                Spacer(),
                Text(
                  "150 جنيه",
                  style: TextStyles.semiBold16,
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Text(
                  "التوصيل  : ",
                  style: TextStyles.regular13.copyWith(
                    color: Color(0xff4E5556),
                  ),
                ),
                Spacer(),
                Text(
                  " 30جنية",
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xff4E5556),
                  ),
                ),
                21.horizontalSpace,
              ],
            ),
            9.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Divider(
                color: Color(0xffCACECE),
                thickness: 1,
              ),
            ),
            9.verticalSpace,
            Row(
              children: [
                Text("الكلي ", style: TextStyles.bold16),
                Spacer(),
                Text(
                  "180 جنية",
                  style: TextStyles.bold16,
                ),
              ],
            ),
          ],
        ));
  }
}
