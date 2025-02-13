import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardInputType,
      this.suffixIcon, this.onSaved,
        this.obscureText = false,
      });

  final String hintText;
  final TextInputType keyboardInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value){
        if(value == null || value.isEmpty){
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: Color(0xff949D9E),
        ),
        suffixIcon: suffixIcon,
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return  OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
