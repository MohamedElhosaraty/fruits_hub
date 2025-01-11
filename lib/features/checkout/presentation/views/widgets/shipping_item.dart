import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_color.dart';
import '../../../../../core/utils/app_text_style.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onTap});

  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          right: 28,
          left: 13,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? AppColor.primaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                decoration: ShapeDecoration(
                  color: isSelected ? AppColor.primaryColor : Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: isSelected ? 4.w : 1.w,
                      color: isSelected ? Colors.white : Color(0xff949D9E),
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.semiBold13),
                  6.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyles.regular13.copyWith(
                      color: Color(0xff000000).withOpacity(.5),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  "${price} جنيه",
                  style: TextStyles.bold13.copyWith(
                    color: AppColor.lightPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
