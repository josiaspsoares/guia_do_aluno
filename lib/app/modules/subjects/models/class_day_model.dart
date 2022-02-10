import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassDayModel {
  final String? id;
  final String name;
  
  ClassDayModel({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ClassDayModel.fromMap(DocumentSnapshot map) {
    return ClassDayModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassDayModel.fromJson(String source) =>
      ClassDayModel.fromMap(json.decode(source));

  String? documentId() => id;
}
