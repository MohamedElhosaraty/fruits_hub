import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_body.dart';

import '../../../../../core/repos/products_repo/products_repo.dart';
import '../../../../../core/services/get_it_services.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: ProductsViewBody(),
    );
  }
}
