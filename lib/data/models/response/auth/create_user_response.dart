
class CreateUserResponse {
  final int id;
  final String name;
  final String email;
  final String password;
  final String avatar;
  final String role;

  CreateUserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.role,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      avatar: json['avatar'],
      role: json['role'],
    );
  }


}
