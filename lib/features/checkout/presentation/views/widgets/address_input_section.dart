import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/widget/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          24.verticalSpace,
          CustomTextFormField(
              hintText: "الاسم كامل",
              keyboardInputType: TextInputType.text,),
          16.verticalSpace,
          CustomTextFormField(
            hintText: "البريد الإلكتروني",
            keyboardInputType: TextInputType.text,),
          16.verticalSpace,
          CustomTextFormField(
              hintText: " العنوان",
              keyboardInputType: TextInputType.emailAddress,),
          16.verticalSpace,
          CustomTextFormField(
              hintText: "المدينه ",
              keyboardInputType: TextInputType.text,),
          16.verticalSpace,
          CustomTextFormField(
              hintText: "رقم الطابق , رقم الشقه .. ",
              keyboardInputType: TextInputType.text,),
          16.verticalSpace,
          CustomTextFormField(
              hintText: "رقم الهاتف ",
              keyboardInputType: TextInputType.phone,),

        ],
      ),
    );
  }
}
