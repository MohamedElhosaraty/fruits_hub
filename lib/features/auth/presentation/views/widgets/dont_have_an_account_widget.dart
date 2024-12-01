import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/auth/presentation/views/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: " لا تمتلك حساب؟   ",
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushNamed(context, SignupView.routeName);
            },
            text: " قم بانشاء حساب",
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
