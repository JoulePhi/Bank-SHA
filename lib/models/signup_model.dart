class SignUpModel {
  final String? name, email, password, pin, profilePicture, ktp;

  SignUpModel(
      {this.name,
      this.email,
      this.password,
      this.pin,
      this.profilePicture,
      this.ktp});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  SignUpModel copyWith({
    String? pin,
    String? profilePicture,
    String? ktp,
  }) {
    return SignUpModel(
      name: name,
      email: email,
      password: password,
      pin: pin ?? this.pin,
      profilePicture: profilePicture ?? this.profilePicture,
      ktp: ktp ?? this.ktp,
    );
  }
}
