import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5.r,
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18.sp,
          ),
        ),
        4.horizontalSpace,
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: AppColor.primaryColor),
        )
      ],
    );
  }
}
