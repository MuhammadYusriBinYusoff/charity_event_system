import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventItemsProvider extends ChangeNotifier {
  EventItemsModel _itemDetails = EventItemsModel();
  List<EventItemsModel> _itemDetailsList = [];

  EventItemsModel get itemDetails => _itemDetails;
  List<EventItemsModel> get itemDetailsList => _itemDetailsList;

  Future<void> createItemDetails(EventItemsModel newItemDetails) async {
    _itemDetails = newItemDetails;
    FirebaseFirestore.instance
        .collection("item")
        .doc(newItemDetails.id)
        .collection("list item")
        .doc()
        .set(_itemDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchAllItemDetails(String? id) async {
    print("test");
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('item')
              .doc(id)
              .collection("list item")
              .get();
      _itemDetailsList = querySnapshot.docs
          .map((doc) => EventItemsModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching item List: $error');
    }
  }
  
}