import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventItemsProvider extends ChangeNotifier {
  EventItemsModel _itemDetails = EventItemsModel();
  List<EventItemsModel> _itemDetailsList = [];

  EventItemsModel get itemDetails => _itemDetails;
  List<EventItemsModel> get itemDetailsList => _itemDetailsList;

  Future<void> createItemDetails(EventItemsModel newItemDetails, String? userId) async {
    _itemDetails = newItemDetails;
    try{
      FirebaseFirestore.instance
        .collection("item")
        .doc(userId)
        .collection("list item")
        .doc(newItemDetails.id)
        .set(_itemDetails.toJson());
    notifyListeners();
    print("Item Data sucessfully created");
    } catch (error) {
      print('Error creating item: $error');
    }
    
  }

  Future<void> fetchEventItemData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventItemId = user.uid;
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('item')
                .doc(eventItemId)
                .collection("list item")
                .get();

        _itemDetailsList = querySnapshot.docs
            .map((doc) => EventItemsModel.fromSnapshot(doc))
            .toList();

        notifyListeners();
      } catch (error) {
        print('Error fetching item List: $error');
      }
    } else {
      print('No user signed in.');
    }
  }

  Future<void> fetchAllItemDetails(String? id) async {
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

  Future<void> deleteEventItem(String? itemId) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("item")
            .doc(user.uid)
            .collection("list item")
            .doc(itemId)
            .delete();

        notifyListeners();
      }
    } catch (error) {
      print('Error deleting item: $error');
    }
  }

  void resetEventItem() async{
    _itemDetails = EventItemsModel();
    notifyListeners();
  }
  
}