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
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        imageUrl: json['imageUrl'],
  );

  void setUser(User user) {
    if(user != null) {
      this.id = user.id;
      this.name = user.name;
      this.username = user.username;
      this.email = user.email;
      this.imageUrl = user.imageUrl;
    }
  }

  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
        'id': this.id,
        'name': this.name,
        'username': this.username,
        'email': this.email,
        'imageUrl': this.imageUrl,
      };  

}