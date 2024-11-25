import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widget/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../cubits/signup_cubit/signup_cubit.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
          buildErrorBar(context, "Success");
        }
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);

        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SignupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }
}
