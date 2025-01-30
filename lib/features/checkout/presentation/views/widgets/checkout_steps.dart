import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentIndex,
      required this.pageController,
      required this.formKey,
      required this.valueNotifier});

  final int currentIndex;
  final GlobalKey<FormState> formKey;

  final ValueNotifier<AutovalidateMode> valueNotifier;

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
              if (currentIndex == 0) {
                _handleShippingSectionValidation(context,index);
              } else if (currentIndex == 1) {
                _handleAddressValidation(context,index);
              } else {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
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
  void _handleShippingSectionValidation(BuildContext context,int index) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    } else {
      buildErrorBar(context, "يرجي تحديد طريقه الدفع");
    }
  }

  void _handleAddressValidation(BuildContext context,int index) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
      buildErrorBar(context, " يرجاي ملئ جميع الحقول");
    }
  }

}

List<String> getSteps() {
  return [
    "الشحن",
    "العنوان",
    "الدفع",
  ];
}
