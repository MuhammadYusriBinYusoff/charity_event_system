import 'package:cloud_firestore/cloud_firestore.dart';

class EventCollaborationModel {
  final String? id;
  final String? cardId;
  final String? columnBelong;
  final String? title;
  final String? subTitle;
  final String? lastEditDate;
  final String? storyPoint;

  EventCollaborationModel({
    this.id,
    this.cardId,
    this.columnBelong,
    this.title,
    this.subTitle,
    this.lastEditDate,
    this.storyPoint,
  });

  static EventCollaborationModel fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return EventCollaborationModel(
      id: snapshot.id,
      cardId: data['cardId'],
      columnBelong: data['columnBelong'],
      title: data['title'],
      subTitle: data['subTitle'],
      lastEditDate: data['lastEditDate'],
      storyPoint: data['storyPoint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "cardId": cardId,
      "columnBelong": columnBelong,
      "title": title,
      "subTitle": subTitle,
      "lastEditDate": lastEditDate,
      "storyPoint": storyPoint,
    };
  }
}