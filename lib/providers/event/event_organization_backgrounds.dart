import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventOrganizationBackgroundProvider extends ChangeNotifier {
  EventOrganizationBackgroundModel _eventOrganizationBackground= EventOrganizationBackgroundModel();
  List<EventOrganizationBackgroundModel> _eventOrganizationBackgroundList = [];

  EventOrganizationBackgroundModel get eventOrganizationBackground => _eventOrganizationBackground;
   List<EventOrganizationBackgroundModel> get eventOrganizationBackgroundList => _eventOrganizationBackgroundList;

  Future<void> createEventOrganizationBackground(EventOrganizationBackgroundModel newEventOrganizationBackground) async {
    _eventOrganizationBackground = newEventOrganizationBackground;
    await FirebaseFirestore.instance
        .collection("eventOrganizationBackground")
        .doc(newEventOrganizationBackground.id)
        .set(_eventOrganizationBackground.toJson());
    notifyListeners();
  }

  Future<void> fetchEventOrganizationBackgroundData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventOrganizationBackgroundId = user.uid;
      CollectionReference eventOrganizationBackgroundCollection =
          FirebaseFirestore.instance.collection('eventOrganizationBackground');
      DocumentSnapshot<Map<String, dynamic>> eventOrganizationBackgroundData = await eventOrganizationBackgroundCollection
          .doc(eventOrganizationBackgroundId)
          .get() as DocumentSnapshot<Map<String, dynamic>>;

      if (eventOrganizationBackgroundData.exists) {
        _eventOrganizationBackground = EventOrganizationBackgroundModel.fromSnapshot(eventOrganizationBackgroundData);
        notifyListeners();
      } else {
        print('Event Organization Background data not found.');
      }
    } else {
      print('No user signed in.');
    }
  }

  Future<void> updateEventOrganizationBackground(EventOrganizationBackgroundModel newEventOrganizationBackground) async {
    _eventOrganizationBackground = newEventOrganizationBackground;
    await FirebaseFirestore.instance
        .collection("eventOrganizationBackground")
        .doc(newEventOrganizationBackground.id)
        .update(_eventOrganizationBackground.toJson());

    int index = _eventOrganizationBackgroundList.indexWhere((background) => background.id == newEventOrganizationBackground.id);
    if (index != -1) {
      _eventOrganizationBackgroundList[index] = newEventOrganizationBackground;
    } else {
      _eventOrganizationBackgroundList.add(newEventOrganizationBackground);
    }

    notifyListeners();
  }

  Future<void> fetchAllEventOrganizationBackground() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('eventOrganizationBackground')
          .get();

      _eventOrganizationBackgroundList = querySnapshot.docs
          .map((doc) => EventOrganizationBackgroundModel.fromSnapshot(doc))
          .toList();

    } catch (error) {
      print('Error fetching event Organization Background List: $error');
    }
  }

  Future<void> deleteEventOrganizationBackground(String? eventOrganizationBackgroundId) async {
    try {
      await FirebaseFirestore.instance
          .collection('eventOrganizationBackground')
          .doc(eventOrganizationBackgroundId)
          .delete();

      _eventOrganizationBackgroundList.removeWhere((event) => event.id == eventOrganizationBackgroundId);
      if (_eventOrganizationBackground.id == eventOrganizationBackgroundId) {
        _eventOrganizationBackground = EventOrganizationBackgroundModel(); 
      }

      notifyListeners();
    } catch (error) {
      print('Error deleting event details: $error');
    }
  }

  void resetEventOrganizationBackground() async{
    _eventOrganizationBackground = EventOrganizationBackgroundModel();
    notifyListeners();
  }
  
}