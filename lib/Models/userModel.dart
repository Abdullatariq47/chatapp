class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'gender': gender,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
    );
  }
}
