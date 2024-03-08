import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventGalleryProvider extends ChangeNotifier {
  EventGalleryModel _eventGallery = EventGalleryModel();

  EventGalleryModel get eventGallery => _eventGallery;

  Future<void> createEventGallery(EventGalleryModel newEventGallery) async {
    _eventGallery = newEventGallery;
    await FirebaseFirestore.instance
        .collection("eventGallery")
        .doc(newEventGallery.id)
        .set(_eventGallery.toJson());
    notifyListeners();
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

  void resetEventGallery() async{
    _eventGallery = EventGalleryModel();
    notifyListeners();
  }
  
}