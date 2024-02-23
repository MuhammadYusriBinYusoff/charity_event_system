import 'package:cloud_firestore/cloud_firestore.dart';

class EventItemsModel {
  final String? id;
  final String? itemName;
  final String? itemQuantity;
  final String? itemUnit;
  final String? itemDate;

  EventItemsModel({
    this.id,
    this.itemName,
    this.itemQuantity,
    this.itemUnit,
    this.itemDate,
  });

  static EventItemsModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventItemsModel(
      id: snapshot['id'],
      itemName: snapshot['itemName'],
      itemQuantity: snapshot['itemQuantity'],
      itemUnit: snapshot['itemUnit'],
      itemDate: snapshot['itemDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "itemName": itemName,
      "itemQuantity": itemQuantity,
      "itemUnit": itemUnit,
      "itemDate": itemDate,
    };
  }
}