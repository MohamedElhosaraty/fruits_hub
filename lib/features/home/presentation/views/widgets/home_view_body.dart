import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widget/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list.dart';

import '../../../../../core/cubits/products_cubit/products_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                16.verticalSpace,
                const CustomHomeAppBar(),
                16.verticalSpace,
                const SearchTextField(),
                12.verticalSpace,
                const FeaturedList(),
                12.verticalSpace,
                const BestSellingHeader(),
                8.verticalSpace,
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),

        ],
      ),
    );
  }
}
