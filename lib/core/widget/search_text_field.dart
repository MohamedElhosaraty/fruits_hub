import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import '../../generated/assets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            spreadRadius: 0,
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: SizedBox(
              width: 20.w,
              child: Center(child: SvgPicture.asset(Assets.imagesSearchIcon))),
          hintText: "ابحث عن.......",
          hintStyle: TextStyles.regular13.copyWith(
            color: Color(0xff949D9E),
          ),
          suffixIcon: SizedBox(
            width: 20.w,
            child: Center(
              child: SvgPicture.asset(Assets.imagesFilter),
            ),
          ),
          border: buildBorder(),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}
