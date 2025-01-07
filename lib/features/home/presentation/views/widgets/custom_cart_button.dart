import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../checkout/presentation/views/checkout_view.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, CheckoutView.routeName);
            },
            text:
            "الدفع   ${context
                .watch<CartCubit>()
                .cartEntity
                .calculateTotalPrice()}  جنيه");
      },
    );
  }
}
