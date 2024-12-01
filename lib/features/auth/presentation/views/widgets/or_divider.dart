import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(
              0xffDDDFDF,
            ),
          ),
        ),
        18.horizontalSpace,
        Text(
          "أو",
          style: TextStyles.semiBold16,
        ),
        18.horizontalSpace,
        Expanded(
          child: Divider(
            color: Color(
              0xffDDDFDF,
            ),
          ),
        ),
      ],
    );
  }
}
