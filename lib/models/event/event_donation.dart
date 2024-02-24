import 'package:cloud_firestore/cloud_firestore.dart';

class EventDonationModel {
  final String? id;
  final String? targetMoney;
  final String? currentCollected;
  final String? startDate;
  final String? endDate;
  final String? bankAccount;

  EventDonationModel({
    this.id,
    this.targetMoney,
    this.currentCollected,
    this.startDate,
    this.endDate,
    this.bankAccount,
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
    };
  }
}