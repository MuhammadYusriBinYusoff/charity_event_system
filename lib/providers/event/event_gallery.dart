import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventGalleryProvider extends ChangeNotifier {
  EventGalleryModel _eventGallery = EventGalleryModel();
  List<EventGalleryModel> _eventGalleryList = [];

  EventGalleryModel get eventGallery => _eventGallery;
  List<EventGalleryModel> get eventGalleryList => _eventGalleryList;

  Future<void> createEventGallery(EventGalleryModel newEventGallery) async {
    _eventGallery = newEventGallery;
    try{
      await FirebaseFirestore.instance
        .collection("eventGallery")
        .doc(newEventGallery.id)
        .set(_eventGallery.toJson());
    notifyListeners();
    print("Gallery Data sucessfully created");

    } catch (error) {
      print('Error creating gallery: $error');
    }
  }

  Future<void> updateEventGallery(EventGalleryModel newEventGallery) async {
    _eventGallery = newEventGallery;
    try{
      await FirebaseFirestore.instance
        .collection("eventGallery")
        .doc(newEventGallery.id)
        .update(_eventGallery.toJson());

    int index = _eventGalleryList.indexWhere((gallery) => gallery.id == newEventGallery.id);
    if (index != -1) {
      _eventGalleryList[index] = newEventGallery;
    } else {
      _eventGalleryList.add(newEventGallery);
    }
    notifyListeners();
    print("Gallery Data sucessfully Updated");
    } catch (error) {
      print('Error update gallery: $error');
    }
  }

  Future<void> fetchEventGalleryData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventGalleryId = user.uid;
      CollectionReference eventGalleryCollection =
          FirebaseFirestore.instance.collection('eventGallery');
      DocumentSnapshot<Map<String, dynamic>> eventGalleryData = await eventGalleryCollection
          .doc(eventGalleryId)
          .get() as DocumentSnapshot<Map<String, dynamic>>;

      if (eventGalleryData.exists) {
        _eventGallery = EventGalleryModel.fromSnapshot(eventGalleryData);
        notifyListeners();
      } else {
        print('Event Gallery data not found.');
      }
    } else {
      print('No user signed in.');
    }
  }

  Future<void> deleteEventGallery(String? eventGalleryId) async {
    try {
      await FirebaseFirestore.instance
          .collection('eventGallery')
          .doc(eventGalleryId)
          .delete();

      _eventGalleryList.removeWhere((event) => event.id == eventGalleryId);
      if (_eventGallery.id == eventGalleryId) {
        _eventGallery = EventGalleryModel(); 
      }

      notifyListeners();
    } catch (error) {
      print('Error deleting event gallery: $error');
    }
  }

  Future<void> fetchAllEventGallery() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('eventGallery').get();

      _eventGalleryList = querySnapshot.docs
          .map((doc) => EventGalleryModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching gallery List: $error');
    }
  }

  void resetEventGallery() async{
    _eventGallery = EventGalleryModel();
    notifyListeners();
  }
  
}