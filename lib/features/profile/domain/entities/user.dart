class User {
  final String id;
  final String? email;
  final String? username;
  final String? phone;
  final String? avatarUrl;

  const User({
    required this.id,
    this.email,
    this.username,
    this.phone,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'phone': phone,
      'avatar_url': avatarUrl,
    };
  }
}
