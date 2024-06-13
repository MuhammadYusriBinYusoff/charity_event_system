import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventDonationProvider extends ChangeNotifier {
  EventDonationModel _donationDetails = EventDonationModel();
  List<EventDonationModel> _donationDetailsList = [];

  EventDonationModel get donationDetails => _donationDetails;
  List<EventDonationModel> get donationDetailsList => _donationDetailsList;

  Future<void> createDonationDetails(
      EventDonationModel newDonationDetails) async {
    _donationDetails = newDonationDetails;
    await FirebaseFirestore.instance
        .collection("moneyDonation")
        .doc(newDonationDetails.id)
        .set(_donationDetails.toJson());
    notifyListeners();
  }

  Future<void> updateDonationDetails(EventDonationModel newDonationDetails) async {
    _donationDetails = newDonationDetails;
    await FirebaseFirestore.instance
        .collection("moneyDonation")
        .doc(newDonationDetails.id)
        .update(_donationDetails.toJson());

    int index = _donationDetailsList.indexWhere((donation) => donation.id == newDonationDetails.id);
    if (index != -1) {
      _donationDetailsList[index] = newDonationDetails;
    } else {
      _donationDetailsList.add(newDonationDetails);
    }

    notifyListeners();
  }

  Future<void> fetchEventDonationData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventDonationId = user.uid;
      CollectionReference eventDonationCollection =
          FirebaseFirestore.instance.collection('moneyDonation');
      DocumentSnapshot<Map<String, dynamic>> eventDonationData =
          await eventDonationCollection.doc(eventDonationId).get()
              as DocumentSnapshot<Map<String, dynamic>>;

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

  Future<void> fetchAllDonationDetails() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('moneyDonation').get();

      _donationDetailsList = querySnapshot.docs
          .map((doc) => EventDonationModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching donation List: $error');
    }
  }

  Future<void> deleteDonationDetails(String? donationDetailsId) async {
    try {
      await FirebaseFirestore.instance
          .collection('moneyDonation')
          .doc(donationDetailsId)
          .delete();

      _donationDetailsList.removeWhere((donation) => donation.id == donationDetailsId);
      if (_donationDetails.id == donationDetailsId) {
        _donationDetails = EventDonationModel(); 
      }

      notifyListeners();
    } catch (error) {
      print('Error deleting donation details: $error');
    }
  }

  void resetEventDonation() async {
    _donationDetails = EventDonationModel();
    notifyListeners();
  }
}
