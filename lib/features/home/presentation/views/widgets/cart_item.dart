import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:fruits_hub/generated/assets.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widget/custom_network_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if(current.cartItemEntity == cartItemEntity){
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 92.h,
                width: 73.w,
                color: Color(0xffF3F5F7),
                child: CustomNetworkImage(
                  imageUrl: cartItemEntity.productEntity.imageUrl!,
                ),
              ),
              17.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13.copyWith(
                            color: Color(0xff06161C),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              context.read<CartCubit>().deleteCartItem(
                                  cartItemEntity);
                            },
                            child: SvgPicture.asset(Assets.imagesTrash)),
                      ],
                    ),
                    3.verticalSpace,
                    Text(
                      ' ${cartItemEntity.calculateTotalWeight()} كم',
                      style: TextStyles.regular13
                          .copyWith(color: AppColor.secondaryColor),
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity,),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16
                              .copyWith(color: AppColor.secondaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
