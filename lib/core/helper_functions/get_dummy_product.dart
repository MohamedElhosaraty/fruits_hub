import 'package:fruits_hub/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Apple",
    code: "12345",
    description: "Fresh Apple",
    price: 10,
    reviews: [],
    expirationsMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: null,
  );
}

List<ProductEntity> getDummyProducts() =>
    List.generate(10, (index) => getDummyProduct());
