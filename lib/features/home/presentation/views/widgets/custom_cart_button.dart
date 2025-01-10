import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../../../../core/helper_functions/build_error_bar.dart';
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
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.pushNamed(context, CheckoutView.routeName,
                    arguments: context.read<CartCubit>().cartEntity);
              } else {
                buildErrorBar(context, "لا يوجد منتجات في السلة");
              }
            },
            text:
                "الدفع   ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}  جنيه");
      },
    );
  }
}
