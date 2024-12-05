import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widget/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key,required this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

   bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: "كلمة المرور",
      keyboardInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: (){
          obscureText = !obscureText;
          setState(() {});
        },
        child:obscureText ? Icon(
          Icons.remove_red_eye,
          color: Color(0xffC9CECF),
        ) : Icon(
          Icons.visibility_off,
          color: Color(0xffC9CECF),
        ),
      ),
    );
  }
}
