import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

import '../../cubits/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          "  لديك ${context.watch<CartCubit>().cartEntity.cartItems.length}   منتجات في سله التسوق ",
          style: TextStyles.regular13.copyWith(color: Color(0xFF1B5E37)),
        ),
      ),
    );
  }
}
