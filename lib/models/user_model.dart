class UserModel {
  String name;
  String place;
  String email;
  String password;
  UserModel({
    required this.name,
    required this.place,
    required this.email,
    required this.password,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map["name"],
        place: map["place"],
        email: map["email"],
        password: map["password"]);
  }
  Map<String, dynamic> toMap() {
    return {"name": name, "place": place, "email": email, "password": password};
  }
}
