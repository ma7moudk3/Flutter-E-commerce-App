class ProductModel {
  String name, image, description, sized, price, id;
  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.sized,
      this.price,
      this.id});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    sized = map['sized'];
    price = map['price'];
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'sized': sized,
      'price': price,
      'id': id,
    };
  }
}
