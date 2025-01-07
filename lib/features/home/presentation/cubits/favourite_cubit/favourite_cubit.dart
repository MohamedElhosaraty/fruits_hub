import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/domain/entites/favourite_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/product_entity.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  FavouriteItemEntity favouriteItemEntity = FavouriteItemEntity(favouriteItems: []);

   bool isExistToFavourite = false ;

  void addProduct(ProductEntity productEntity) {
    favouriteItemEntity.addFavouriteItem(productEntity);
    emit(FavoriteItemAdded());
  }

  void deleteFavouriteItem(ProductEntity productEntity) {
    favouriteItemEntity.removeFavouriteItem(productEntity);
    emit(FavoriteItemRemoved());
  }

   bool isFavouriteExist(ProductEntity productEntity) {
    for(var item in favouriteItemEntity.favouriteItems) {
      if(item == productEntity) {
        return isExistToFavourite = true;
      }
    }
      return isExistToFavourite = false;
    

  }


}
