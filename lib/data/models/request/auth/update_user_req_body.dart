

class UpdateUserRequestBody {
  final String email;
  final String name;

  UpdateUserRequestBody({required this.email, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
    };
  }
}
