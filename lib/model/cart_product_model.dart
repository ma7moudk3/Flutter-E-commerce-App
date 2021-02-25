class CartProductModel {
  String id, name, image, price;
  int quantity;
  CartProductModel({this.name, this.image, this.price, this.quantity, this.id});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'id': id
    };
  }
}
