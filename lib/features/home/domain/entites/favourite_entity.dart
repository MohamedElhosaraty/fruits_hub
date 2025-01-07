import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class FavouriteItemEntity extends Equatable {
  final List<ProductEntity> favouriteItems;

  FavouriteItemEntity({required this.favouriteItems,});

  addFavouriteItem(ProductEntity product) {
    favouriteItems.add(product);
  }

  removeFavouriteItem(ProductEntity product) {
    favouriteItems.remove(product);
  }

  @override
  List<Object?> get props => [ProductEntity];
}