class UserModel {
  String userId, email, name, picture;
  UserModel({this.email, this.name, this.picture, this.userId});
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else {
      userId = map['userId'];
      email = map['email'];
      name = map['name'];
      picture = map['picture'];
    }
  }

  toJson() {
    return {'userId': userId, 'email': email, 'name': name, 'picture': picture};
  }
}
