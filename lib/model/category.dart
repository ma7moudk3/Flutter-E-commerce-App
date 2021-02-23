class CategoryModel {
  String name, picture;
  CategoryModel({this.name, this.picture});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map['name'];
      picture = map['icon'];
    }
  }

  toJson() {
    return {'name': name, 'icon': picture};
  }
}
