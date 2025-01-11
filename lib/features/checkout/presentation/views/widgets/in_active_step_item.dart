import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.text});

  final String index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: Color(0xffF2F3F3),
          child: Text(
            index,
            style: TextStyles.semiBold13,
          ),
        ),
        4.horizontalSpace,
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: Color(0xffAAAAAA)),
        )
      ],
    );
  }
}
