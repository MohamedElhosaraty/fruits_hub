import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key, required this.currentIndex, required this.pageController});

  final int currentIndex;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      getSteps().length,
      (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }else {
                buildErrorBar(context, "يرجي تحديد طريقه الدفع");
              }
            },
            child: StepItem(
              isActive: index <= currentIndex,
              index: (index + 1).toString(),
              text: getSteps()[index],
            ),
          ),
        );
      },
    ));
  }
}

List<String> getSteps() {
  return [
    "الشحن",
    "العنوان",
    "الدفع",
  ];
}
