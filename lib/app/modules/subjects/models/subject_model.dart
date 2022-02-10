import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectModel {
  final String id;
  final String name;
  final String modality;
  final String link;
  final String recordedLessonsLink;
  final String professorID;
  final int period;
  final List<String> classDays;
  final List<String> classTime;
  SubjectModel({
    required this.id,
    required this.name,
    required this.modality,
    required this.link,
    required this.recordedLessonsLink,
    required this.professorID,
    required this.period,
    required this.classDays,
    required this.classTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'modality': modality,
      'link': link,
      'recordedLessonsLink': recordedLessonsLink,
      'professorID': professorID,
      'period': period,
      'classDays': classDays,
      'classTime': classTime,
    };
  }

  factory SubjectModel.fromMap(DocumentSnapshot map) {
    return SubjectModel(
      id: map['id'],
      name: map['name'],
      modality: map['modality'],
      link: map['link'],
      recordedLessonsLink: map['recordedLessonsLink'],
      professorID: map['professorID'],
      period: map['period'],
      classDays: List<String>.from(map['classDays']),
      classTime: List<String>.from(map['classTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source));

  String? documentId() => id;
}
