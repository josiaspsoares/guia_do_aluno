import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassTimeModel {
  final String? id;
  final String name;

  ClassTimeModel({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ClassTimeModel.fromMap(DocumentSnapshot map) {
    return ClassTimeModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassTimeModel.fromJson(String source) =>
      ClassTimeModel.fromMap(json.decode(source));

  String? documentId() => id;
}
