import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.created,
      required this.belt 
      });

  factory User.fromMap(String id, Map<String, dynamic> data) {
    return User(
      id: id,
      name: data['name'],
      belt: data['belt'],
      email: data['email'],
      created: data['created'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'created': created,
        'belt' : belt
      };

  final String id;
  final String belt;
  final String name;
  final String email;
  final Timestamp created;
}