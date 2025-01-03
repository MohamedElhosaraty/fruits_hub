import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import '../../../../../core/utils/app_text_style.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemButton(
          color: AppColor.primaryColor,
          icon: Icons.add,
          colorIcon: Colors.white,
          onTap: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        16.horizontalSpace,
        Text(
          cartItemEntity.count.toString(),
          style: TextStyles.bold16.copyWith(color: Color(0xff06140C)),
        ),
        16.horizontalSpace,
        CartItemButton(
          color: Color(0xffF3F5F7),
          icon: Icons.remove,
          colorIcon: Color(0xff979899),
          onTap: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);

          },

        ),
      ],
    );
  }
}

class CartItemButton extends StatelessWidget {
  const CartItemButton({super.key, required this.color, required this.icon, required this.colorIcon, required this.onTap});
  final Color color;
  final IconData icon;
  final Color colorIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22.r,
        backgroundColor: color,
        child: Icon(
          icon,
          color: colorIcon,
          size: 24.sp,
        ),
      ),
    );
  }
}
