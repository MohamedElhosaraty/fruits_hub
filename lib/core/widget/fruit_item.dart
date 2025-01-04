import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widget/custom_network_image.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubits/favourite_cubit/favourite_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 163.w,
      height: 214.h,
      decoration: ShapeDecoration(
        color: const Color(0xffF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 10.h,
              child: Column(
                children: [
                  productEntity.imageUrl == null ? Container(
                    color: Colors.grey,
                    height: 80,
                    width: 100,
                  ) : Flexible(
                    child: CustomNetworkImage(
                      imageUrl: productEntity.imageUrl!,
                    ),
                  ),
                  20.verticalSpace,
                  ListTile(
                    title: Text(
                      productEntity.name,style: TextStyles.semiBold16,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${productEntity.price} جنيه",
                            style: TextStyles.semiBold13.copyWith(
                              color: AppColor.secondaryColor
                            ),
                          ),
                          TextSpan(
                            text: " / الكيلو",
                            style: TextStyles.semiBold13.copyWith(
                              color: AppColor.lightSecondaryColor
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: (){
                        context.watch<CartCubit>().addProduct(productEntity);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(Icons.add,color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () {
                context.watch<FavouriteCubit>().addProduct(productEntity);
              },
              icon: Icon(Icons.favorite,
              color: context.read<FavouriteCubit>().isExistToFavourite ? Colors.red : Colors.grey,),
          ),
          )
        ],
      ),
    );
  }
}
