import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetailsModel {
  final String? id;
  final String? eventName;
  final String? eventDescription;

  EventDetailsModel({
    this.id,
    this.eventName,
    this.eventDescription,
  });

  static EventDetailsModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventDetailsModel(
      id: snapshot['id'],
      eventName: snapshot['eventName'],
      eventDescription: snapshot['eventDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "eventName": eventName,
      "eventDescription": eventDescription,
    };
  }
}
