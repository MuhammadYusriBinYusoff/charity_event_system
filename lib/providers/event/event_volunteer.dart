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
      VolunteerModel newVolunteerDetails, String? organizerId) async {
    _volunteerDetails = newVolunteerDetails;

    try{
      FirebaseFirestore.instance
        .collection("volunteer")
        .doc(organizerId)
        .collection("list volunteer")
        .doc(newVolunteerDetails.id)
        .set(_volunteerDetails.toJson());
    notifyListeners();
    print("Volunteer Data sucessfully created");
    }catch (error) {
      print('Error creating volunteer: $error');
    }
  }

  Future<void> fetchEventVolunteerData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventVolunteerId = user.uid;
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('volunteer')
                .doc(eventVolunteerId)
                .collection("list volunteer")
                .get();

        _volunteerDetailsList = querySnapshot.docs
            .map((doc) => VolunteerModel.fromSnapshot(doc))
            .toList();

        notifyListeners();
      } catch (error) {
        print('Error fetching volunteer List: $error');
      }
    } else {
      print('No user signed in.');
    }
  }

  Future<void> deleteEventVolunteer(String? volunteerId) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("volunteer")
            .doc(user.uid)
            .collection("list volunteer")
            .doc(volunteerId)
            .delete();

        notifyListeners();
      }
    } catch (error) {
      print('Error deleting volunteer: $error');
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
