import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetailsModel {
  final String? id;
  final String? eventName;
  final String? eventDescription;
  final String? type;
  final String? photoEventUrl;

  EventDetailsModel({
    this.id,
    this.eventName,
    this.eventDescription,
    this.type,
    this.photoEventUrl,
  });

  static EventDetailsModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventDetailsModel(
      id: snapshot['id'],
      eventName: snapshot['eventName'],
      eventDescription: snapshot['eventDescription'],
      type: snapshot['type'],
      photoEventUrl: snapshot['photoEventUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "eventName": eventName,
      "eventDescription": eventDescription,
      "type": type,
      "photoEventUrl": photoEventUrl,
    };
  }
}
