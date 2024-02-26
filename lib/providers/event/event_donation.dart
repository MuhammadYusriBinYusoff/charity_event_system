import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventDonationProvider extends ChangeNotifier {
  EventDonationModel _donationDetails = EventDonationModel();

  EventDonationModel get donationDetails => _donationDetails;

  Future<void> createDonationDetails(EventDonationModel newDonationDetails) async {
    _donationDetails = newDonationDetails;
    await FirebaseFirestore.instance
        .collection("moneyDonation")
        .doc(newDonationDetails.id)
        .set(_donationDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventDonationData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventDonationId = user.uid;
      CollectionReference eventDonationCollection =
          FirebaseFirestore.instance.collection('moneyDonation');
      DocumentSnapshot<Map<String, dynamic>> eventDonationData = await eventDonationCollection
          .doc(eventDonationId)
          .get() as DocumentSnapshot<Map<String, dynamic>>;

      if (eventDonationData.exists) {
        _donationDetails = EventDonationModel.fromSnapshot(eventDonationData);
        notifyListeners();
      } else {
        print('Event Donation data not found.');
      }
    } else {
      print('No user signed in.');
    }
  }

  void resetEventDonation() async{
    _donationDetails = EventDonationModel();
    notifyListeners();
  }
  
}