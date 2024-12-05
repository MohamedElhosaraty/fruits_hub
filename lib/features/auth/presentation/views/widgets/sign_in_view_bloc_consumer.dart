import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widget/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';

class SignInViewBlocConsumer extends StatelessWidget {
  const SignInViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(listener: (context, state) {
      if (state is SignInSuccess) {
        Navigator.pushNamed(context, MainView.routeName);
        buildErrorBar(context, 'Success');
      }
      if (state is SignInFailure) {
        buildErrorBar(context, state.message);
      }
    }, builder: (context, state) {
      return CustomProgressHud(
        isLoading: state is SignInLoading ? true : false,
        child: const SigninViewBody(),
      );
    });
  }
}
