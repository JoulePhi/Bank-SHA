class EditProfileModel {
  final String? name;
  final String? username;
  final String? email;
  final String? password;

  EditProfileModel({
    this.name,
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
