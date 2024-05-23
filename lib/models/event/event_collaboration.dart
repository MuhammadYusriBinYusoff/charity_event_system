import 'package:cloud_firestore/cloud_firestore.dart';

class EventCollaborationModel {
  final String? id;
  final String? cardId;
  final String? columnBelong;
  final String? title;
  final String? subTitle;
  final String? lastEditDate;
  final String? storyPoint;
  final String? startDate; // Change to String
  final String? endDate;
  final String? userCardImage;
  final String? userCardName;
  final String? userCardId;

  EventCollaborationModel({
    this.id,
    this.cardId,
    this.columnBelong,
    this.title,
    this.subTitle,
    this.lastEditDate,
    this.storyPoint,
    this.startDate,
    this.endDate,
    this.userCardImage,
    this.userCardName,
    this.userCardId,
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
      startDate : data['startDate'],
      endDate: data['endDate'],
      userCardImage: data['userCardImage'],
      userCardName: data['userCardName'],
      userCardId: data['userCardId'],
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
      "startDate": startDate,
      "endDate": endDate,
      "userCardImage": userCardImage,
      "userCardName": userCardName,
      "userCardId": userCardId,
    };
  }
}