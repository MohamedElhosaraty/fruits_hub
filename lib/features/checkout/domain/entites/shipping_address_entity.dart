class ShippingAddressEntity {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.floor,
  });

  @override
  String toString() {
    return "$address $floor $city";
  }
}
