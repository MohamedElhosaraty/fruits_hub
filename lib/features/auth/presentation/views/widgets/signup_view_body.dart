import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/core/widget/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email, password;
  late bool isTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              24.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: " الاسم كامل",
                keyboardInputType: TextInputType.name,
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: "البريد الالكتروني",
                keyboardInputType: TextInputType.emailAddress,
              ),
              16.verticalSpace,
              PasswordField(onSaved: (value) {
                password = value!;
              },),
              16.verticalSpace,
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsChecked = value;
                },),
              30.verticalSpace,
              CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (isTermsChecked) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                                email, password, userName);
                      }else{
                        buildErrorBar(
                            context, "يجب الموافقة على الشروط والاحكام");
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "إنشاء حساب جديد"),
              26.verticalSpace,
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
