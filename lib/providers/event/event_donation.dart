import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  
}