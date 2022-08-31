class UserModel {
  final String username;
  final String address;

  UserModel({
    required this.username,
    required this.address,
  });
  Map<String, dynamic> getJson() => {
        "name": username,
        "address": address,
      };

  factory UserModel.getModelFromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['name'],
      address: json['address'],
    );
  }
}
