import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widget/custom_app_bar_home.dart';
import 'package:fruits_hub/core/widget/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
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
                // edit
                const CustomAppBarHome(title: "المنتجات",showBackButton: false,),
                16.verticalSpace,
                const SearchTextField(),
                12.verticalSpace,
                ProductsViewHeader(
                    productsLength: context.read<ProductsCubit>().productLength),
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
