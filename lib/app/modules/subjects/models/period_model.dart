import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class PeriodModel {
  final String? id;
  final String name;

  PeriodModel({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory PeriodModel.fromMap(DocumentSnapshot map) {
    return PeriodModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodModel.fromJson(String source) =>
      PeriodModel.fromMap(json.decode(source));

  String? documentId() => id;
}
