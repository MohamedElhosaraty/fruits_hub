import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left:16),
        decoration: ShapeDecoration(
          color: Color(0xffEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),),
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: ShapeDecoration(
                color: Color(0xff1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            4.horizontalSpace,
            Text(
              text,
              style: TextStyles.semiBold11.copyWith(
                color: AppColor.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
