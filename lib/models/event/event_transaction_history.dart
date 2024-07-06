import 'package:cloud_firestore/cloud_firestore.dart';

class EventTransactionModel {
  final String? id;
  final String? pdfUrls;
  final String? pdfName;
  final String? donatorName;

  EventTransactionModel({
    this.id,
    this.pdfUrls,
    this.pdfName,
    this.donatorName,
  });

  static EventTransactionModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventTransactionModel(
      id: snapshot['id'],
      pdfUrls: snapshot['pdfUrls'],
      pdfName: snapshot['pdfName'],
      donatorName: snapshot['donatorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "pdfUrls": pdfUrls,
      "pdfName": pdfName,
      "donatorName": donatorName,
    };
  }
}