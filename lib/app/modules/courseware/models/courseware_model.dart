import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CoursewareModel {
  final String id;
  final String title;
  final String description;
  final String link;
  final String subjectID;
  
  CoursewareModel({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.subjectID,
  });
  
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'link': link,
      'subjectID': subjectID,
    };
  }

  factory CoursewareModel.fromMap(DocumentSnapshot map) {
    return CoursewareModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      link: map['link'],
      subjectID: map['subjectID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursewareModel.fromJson(String source) =>
      CoursewareModel.fromMap(json.decode(source));

  String? documentId() => id;
}
