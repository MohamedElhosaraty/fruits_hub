import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/get_dummy_product.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                Text(
                  "الأكثر مبيعًا",
                  style: TextStyles.bold16,
                ),
                8.verticalSpace,
              ],
            ),
          ),
           ProductsGridView(products:
           getDummyProducts(),),
        ],
      ),
    );
  }
}
