import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventVolunteerProvider extends ChangeNotifier {
  VolunteerModel _volunteerDetails = VolunteerModel();
  List<VolunteerModel> _volunteerDetailsList = [];

  VolunteerModel get volunteerDetails => _volunteerDetails;
  List<VolunteerModel> get volunteerDetailsList => _volunteerDetailsList;

  Future<void> createVolunteerDetails(
      VolunteerModel newVolunteerDetails) async {
    _volunteerDetails = newVolunteerDetails;

    FirebaseFirestore.instance
        .collection("volunteer")
        .doc(newVolunteerDetails.id)
        .collection("list volunteer")
        .doc()
        .set(_volunteerDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventVolunteerData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventVolunteerId = user.uid;
      CollectionReference eventVolunteerCollection =
          FirebaseFirestore.instance.collection('volunteer');
      DocumentSnapshot<Map<String, dynamic>> eventVolunteerData =
          await eventVolunteerCollection.doc(eventVolunteerId).get()
              as DocumentSnapshot<Map<String, dynamic>>;

      if (eventVolunteerData.exists) {
        _volunteerDetails = VolunteerModel.fromSnapshot(eventVolunteerData);
        notifyListeners();
      } else {
        print('Volunteer data not found.');
      }
    } else {
      print('No user signed in.');
    }
  }

  //Use for display data on table
  Future<void> fetchAllVolunteerDetails(String? id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('volunteer')
              .doc(id)
              .collection("list volunteer")
              .get();

      _volunteerDetailsList = querySnapshot.docs
          .map((doc) => VolunteerModel.fromSnapshot(doc))
          .toList();

      _volunteerDetailsList.forEach((volunteer) {
        print("Name: ${volunteer.volunteerName}");
        print("Age: ${volunteer.volunteerAdress}");
        print("\n");
      });
    } catch (error) {
      print('Error fetching volunteer List: $error');
    }
  }

  void resetEventVolunteer() async {
    _volunteerDetails = VolunteerModel();
    notifyListeners();
  }
}
