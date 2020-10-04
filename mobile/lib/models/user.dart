import 'dart:convert';

class User {
  int id;
  String name;
  String username;
  String email;
  String imageUrl;

  User({this.id, this.name, this.email, this.imageUrl, this.username});

  factory User.fromJson(String str) =>
      User.fromMap(json.decode(str));
  factory User.fromMap(Map<String, dynamic> json) => User(
        id: int.tryParse(json['id']) ?? 0,
        name: json['name'],
        username: json['username'],
        email: json['email'],
        imageUrl: json['imageUrl'],
  );
}