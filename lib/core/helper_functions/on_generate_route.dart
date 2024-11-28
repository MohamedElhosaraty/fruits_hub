import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/best_selling_fruits/views/best_selling_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}