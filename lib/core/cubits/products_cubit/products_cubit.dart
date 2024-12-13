import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productLength = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
            (failure) => emit(
                ProductsFailure( errorMassage: failure.message),),
            (products) => emit(ProductsSuccess(products: products),),);
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
            (failure) => emit(
                ProductsFailure( errorMassage: failure.message),),
            (products) {
              productLength = products.length;
              emit(ProductsSuccess(products: products),);
            },);
  }
}
