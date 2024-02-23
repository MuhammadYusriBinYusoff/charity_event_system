import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  
}