class User {
  final String id;
  final String email;

  User({
    required this.id,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final email = json['email'];
    final id = json['localId'];
    return User(id: id, email: email);
  }

  Map<String, dynamic> toJson() {
    return {
      'localId': id,
      'email': email,
    };
  }
}
