import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import '../../../../../generated/assets.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});

  final int productsLength ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productsLength  نتائج ',
          style: TextStyles.bold16,
        ),
        Spacer(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: ShapeDecoration(
              color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  side: BorderSide(color: Color(0x66CACECE),
                      width: 1.w),
                )
            ),
            child: SvgPicture.asset(Assets.imagesFilter)),
      ],
    );
  }
}
