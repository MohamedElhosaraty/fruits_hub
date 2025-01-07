part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavoriteItemAdded extends FavouriteState {}

final class FavoriteItemRemoved extends FavouriteState {}

