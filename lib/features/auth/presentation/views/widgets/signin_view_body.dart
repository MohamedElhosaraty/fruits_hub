import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/core/widget/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruits_hub/generated/assets.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email , password ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              24.verticalSpace,
              CustomTextFormField(
                onSaved: (value){
                  email = value!;
                },
                hintText: "البريد الالكتروني",
                keyboardInputType: TextInputType.emailAddress,
              ),
              16.verticalSpace,
              PasswordField(
                  onSaved: (value){
                password = value!;
              }),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyles.bold13.copyWith(
                      color: AppColor.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              33.verticalSpace,
              CustomButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      context.read<SignInCubit>().signInWithEmailAndPassword(email, password);
                    }else{
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: "تسجيل الدخول",
              ),
              33.verticalSpace,
              const DontHaveAnAccountWidget(),
              33.verticalSpace,
              const OrDivider(),
              16.verticalSpace,
              SocialLoginButton(
                  onPressed: (){
                    context.read<SignInCubit>().signInWithGoogle();
                  },
                  image: Assets.imagesGoogleIcon,
                  title: "تسجيل بواسطة جوجل",
              ),
              16.verticalSpace,
              Platform.isIOS ?  Column(
                children: [
                  SocialLoginButton(
                    onPressed: (){
                      context.read<SignInCubit>().signInWithApple();
                    },
                    image: Assets.imagesAppleIcon,
                    title: "تسجيل بواسطة أبل",
                  ),
                  16.verticalSpace,
                ],
              ):  const SizedBox(),
              SocialLoginButton(
                onPressed: (){
                  context.read<SignInCubit>().signInWithFacebook();
                },
                image: Assets.imagesFacebookIcon,
                title: "تسجيل بواسطة فيسبوك",
              ),
              16.verticalSpace,
              SocialLoginButton(
                onPressed: (){
                  context.read<SignInCubit>().signInWithTwitter();
                },
                image: Assets.imagesTwitter,
                title: "تسجيل بواسطة تويتر",
              ),

            ],
          ),
        ),
      ),
    );
  }
}
