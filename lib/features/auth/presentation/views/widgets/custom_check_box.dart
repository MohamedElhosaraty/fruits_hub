import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/generated/assets.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        height: 24.h,
        width: 24.w,
        duration: Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColor.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5.w,
              color: isChecked ? Colors.transparent : Color(0xffDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(Assets.imagesCheck),
              )
            : const SizedBox(),
      ),
    );
  }
}
