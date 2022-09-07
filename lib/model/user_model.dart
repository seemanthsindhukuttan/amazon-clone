class UserModel {
  final String username;
  final String address;

  UserModel({
    required this.username,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        "name": username,
        "address": address,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['name'],
      address: json['address'],
    );
  }
}
