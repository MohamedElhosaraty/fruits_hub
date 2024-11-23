import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.title});

  final void Function() onPressed;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              width: 1,
              color: Color(0xffDDDFDF),
            )
          )
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image,width: 25.w,),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16.copyWith(
            color: Color(0xff0C0D0D)
          ),
          ),
        ),
      ),
    );
  }
}
