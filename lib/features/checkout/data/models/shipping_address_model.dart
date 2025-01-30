import '../../domain/entites/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.floor,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      address: entity.address,
      city: entity.city,
      floor: entity.floor,
    );
  }

  toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "floor": floor,
    };
  }

  @override
  String toString() {
    return "$address $floor $city";
  }
}
