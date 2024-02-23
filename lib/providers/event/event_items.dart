import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventItemsProvider extends ChangeNotifier {
  EventItemsModel _itemDetails = EventItemsModel();

  EventItemsModel get itemDetails => _itemDetails;

  Future<void> createItemDetails(EventItemsModel newItemDetails) async {
    _itemDetails = newItemDetails;
    await FirebaseFirestore.instance
        .collection("item")
        .doc(newItemDetails.id)
        .set(_itemDetails.toJson());
    notifyListeners();
  }
  
}