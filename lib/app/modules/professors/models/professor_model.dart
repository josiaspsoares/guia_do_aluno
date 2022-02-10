import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfessorModel {
  final String id;
  final String name;
  final String email;
  final String phone;

  ProfessorModel(
      {required this.name,
      required this.id,
      required this.email,
      required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory ProfessorModel.fromMap(DocumentSnapshot map) {
    return ProfessorModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessorModel.fromJson(String source) =>
      ProfessorModel.fromMap(json.decode(source));

  String? documentId() => id;
}
