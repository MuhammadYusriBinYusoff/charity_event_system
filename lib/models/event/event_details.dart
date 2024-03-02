import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetailsModel {
  final String? id;
  final String? eventName;
  final String? eventDescription;
  final String? type;

  EventDetailsModel({
    this.id,
    this.eventName,
    this.eventDescription,
    this.type,
  });

  static EventDetailsModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventDetailsModel(
      id: snapshot['id'],
      eventName: snapshot['eventName'],
      eventDescription: snapshot['eventDescription'],
      type: snapshot['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "eventName": eventName,
      "eventDescription": eventDescription,
      "type": type,
    };
  }
}
