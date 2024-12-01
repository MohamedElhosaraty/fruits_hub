import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: " تمتلك حساب بالفعل؟    ",
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pop(context);
            },
            text: "تسجيل دخول",
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
