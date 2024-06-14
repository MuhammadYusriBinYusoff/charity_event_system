import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetailsModel {
  final String? id;
  final String? eventName;
  final String? eventDescription;
  final String? type;
  final String? photoEventUrl;
  final String? groupLinkUrl;
  final String? passwordCollaboration;

  EventDetailsModel({
    this.id,
    this.eventName,
    this.eventDescription,
    this.type,
    this.photoEventUrl,
    this.groupLinkUrl,
    this.passwordCollaboration,
  });

  static EventDetailsModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventDetailsModel(
      id: snapshot['id'],
      eventName: snapshot['eventName'],
      eventDescription: snapshot['eventDescription'],
      type: snapshot['type'],
      photoEventUrl: snapshot['photoEventUrl'],
      groupLinkUrl: snapshot['groupLinkUrl'],
      passwordCollaboration: snapshot['passwordCollaboration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "eventName": eventName,
      "eventDescription": eventDescription,
      "type": type,
      "photoEventUrl": photoEventUrl,
      "groupLinkUrl": groupLinkUrl,
      "passwordCollaboration": passwordCollaboration,
    };
  }
}
