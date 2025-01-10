import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener((){
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          20.verticalSpace,
          CheckoutSteps(
            pageController: pageController,
            currentIndex: currentIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(
              onPressed: () {
                if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(
                    currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                }else{
                  buildErrorBar(context, "قم باختيار طريقه الدفع");
                }
              },
              text: getStepText(currentIndex),),
          33.verticalSpace,
        ],
      ),
    );
  }

  String getStepText(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return "التالي";
      case 1:
        return "التالي";
      case 2:
        return "الدفع عبر PayPal";
      default:
        return "التالي";
    }
  }
}
