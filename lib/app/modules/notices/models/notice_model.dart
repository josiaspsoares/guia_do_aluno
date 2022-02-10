import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeModel {
  final String id;
  final String title;
  final String description;
  final String link;
  final DateTime sendDate;
  final String userID;

  NoticeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.sendDate,
    required this.userID,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'link': link,
      'sendDate': Timestamp.fromDate(sendDate),
      'userID': userID,
    };
  }

  factory NoticeModel.fromMap(DocumentSnapshot map) {
    return NoticeModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      link: map['link'],
      sendDate: DateTime.parse(map['sendDate'].toDate().toString()),
      userID: map['userID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticeModel.fromJson(String source) =>
      NoticeModel.fromMap(json.decode(source));

  String? documentId() => id;
}
