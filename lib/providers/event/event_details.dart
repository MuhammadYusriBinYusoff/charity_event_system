import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventDetailsProvider extends ChangeNotifier {
  EventDetailsModel _eventDetails = EventDetailsModel();
  List<EventDetailsModel> _eventDetailsList = [];

  EventDetailsModel get eventDetails => _eventDetails;
   List<EventDetailsModel> get eventDetailsList => _eventDetailsList;

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

  Future<void> updateEventDetails(EventDetailsModel newEventDetails) async {
    _eventDetails = newEventDetails;
    await FirebaseFirestore.instance
        .collection("eventDetails")
        .doc(newEventDetails.id)
        .update(_eventDetails.toJson());

    int index = _eventDetailsList.indexWhere((event) => event.id == newEventDetails.id);
    if (index != -1) {
      _eventDetailsList[index] = newEventDetails;
    } else {
      _eventDetailsList.add(newEventDetails);
    }

    notifyListeners();
  }

  Future<void> fetchAllEventDetails() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('eventDetails')
          .get();

      _eventDetailsList = querySnapshot.docs
          .map((doc) => EventDetailsModel.fromSnapshot(doc))
          .toList();

    } catch (error) {
      print('Error fetching event details List: $error');
    }
  }

  Future<void> deleteEventDetails(String? eventDetailsId) async {
    try {
      await FirebaseFirestore.instance
          .collection('eventDetails')
          .doc(eventDetailsId)
          .delete();

      _eventDetailsList.removeWhere((event) => event.id == eventDetailsId);
      if (_eventDetails.id == eventDetailsId) {
        _eventDetails = EventDetailsModel(); 
      }

      notifyListeners();
    } catch (error) {
      print('Error deleting event details: $error');
    }
  }

  void resetEventDetails() async{
    _eventDetails = EventDetailsModel();
    notifyListeners();
  }
  
}