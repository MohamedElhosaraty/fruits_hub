import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_cart_button.dart';
import '../../../../../core/widget/custom_app_bar_home.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  16.verticalSpace,
                  const CustomAppBarHome(
                    title: "السلة",
                    showNotification: false,
                  ),
                  const CartHeader(),
                  24.verticalSpace,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomDivider(),
            ),
            CartItemList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).size.height * .03,
          child: CustomCartButton(),
        ),
      ],
    );
  }
}
