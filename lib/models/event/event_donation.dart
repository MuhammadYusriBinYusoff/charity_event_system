import 'package:cloud_firestore/cloud_firestore.dart';

class EventDonationModel {
  final String? id;
  final double? targetMoney;
  final double? currentCollected;
  final String? startDate;
  final String? endDate;
  final String? bankAccount;
  final String? photoEventUrl;

  EventDonationModel({
    this.id,
    this.targetMoney,
    this.currentCollected,
    this.startDate,
    this.endDate,
    this.bankAccount,
    this.photoEventUrl,
  });

  static EventDonationModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventDonationModel(
      id: snapshot['id'],
      targetMoney: snapshot['targetMoney'],
      currentCollected: snapshot['currentCollected'],
      startDate: snapshot['startDate'],
      endDate: snapshot['endDate'],
      bankAccount: snapshot['bankAccount'],
      photoEventUrl: snapshot['photoEventUrl']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "targetMoney": targetMoney,
      "currentCollected": currentCollected,
      "startDate": startDate,
      "endDate": endDate,
      "bankAccount": bankAccount,
      "photoEventUrl": photoEventUrl,
    };
  }
}