import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModalityModel {
  final String? id;
  final String name;

  ModalityModel({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ModalityModel.fromMap(DocumentSnapshot map) {
    return ModalityModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModalityModel.fromJson(String source) =>
      ModalityModel.fromMap(json.decode(source));

  String? documentId() => id;
}
