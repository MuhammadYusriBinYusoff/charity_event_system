import 'package:cloud_firestore/cloud_firestore.dart';

class EventOrganizationBackgroundModel {
  final String? id;
  final String? backgroundDescription;
  final String? photoEventUrl;

  EventOrganizationBackgroundModel({
    this.id,
    this.backgroundDescription,
    this.photoEventUrl,
  });

  static EventOrganizationBackgroundModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventOrganizationBackgroundModel(
      id: snapshot['id'],
      backgroundDescription: snapshot['backgroundDescription'],
      photoEventUrl: snapshot['photoEventUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "backgroundDescription": backgroundDescription,
      "photoEventUrl": photoEventUrl,
    };
  }
}