import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import 'custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChanged: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
              },
        ),
        16.horizontalSpace,
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "من خلال إنشاء حساب ، فإنك توافق على  ",
                  style:
                      TextStyles.semiBold13.copyWith(color: Color(0xff949D9E)),
                ),
                TextSpan(
                  text: " الشروط والأحكام الخاصة بنا",
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColor.lightPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
