import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventDetailsProvider extends ChangeNotifier {
  EventDetailsModel _eventDetails = EventDetailsModel();

  EventDetailsModel get eventDetails => _eventDetails;

  Future<void> createEventDetails(EventDetailsModel newEventDetails) async {
    _eventDetails = newEventDetails;
    await FirebaseFirestore.instance
        .collection("eventDetails")
        .doc(newEventDetails.id)
        .set(_eventDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventDetailsData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventDetailsId = user.uid;
      CollectionReference eventDetailsCollection =
          FirebaseFirestore.instance.collection('eventDetails');
      DocumentSnapshot<Map<String, dynamic>> eventDetailsData = await eventDetailsCollection
          .doc(eventDetailsId)
          .get() as DocumentSnapshot<Map<String, dynamic>>;

      if (eventDetailsData.exists) {
        _eventDetails = EventDetailsModel.fromSnapshot(eventDetailsData);
        notifyListeners();
      } else {
        print('Event Details data not found.');
      }
    } else {
      print('No user signed in.');
    }
  }

  void resetEventDetails() async{
    _eventDetails = EventDetailsModel();
    notifyListeners();
  }
  
}