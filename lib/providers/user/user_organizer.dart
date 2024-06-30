import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class OrganizerProvider extends ChangeNotifier {
  OrganizerModel _organizers = OrganizerModel();
  List<OrganizerModel> _organizerList = [];

  OrganizerModel get organizers => _organizers;
  List<OrganizerModel> get organizerList => _organizerList;

  Future<void> createOrganizer(OrganizerModel newOrganizer) async {
    _organizers = newOrganizer;
    try {
      await FirebaseFirestore.instance
          .collection("organizationAccount")
          .doc(newOrganizer.id)
          .set(_organizers.toJson());
      notifyListeners();
      print("Organizer Data sucessfully created");
    } catch (error) {
      print('Error creating organizers: $error');
    }
  }

  Future<void> fetchOrganizerData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('organizationAccount');
      DocumentSnapshot<Map<String, dynamic>> userData = await usersCollection
          .doc(userId)
          .get() as DocumentSnapshot<Map<String, dynamic>>;

      if (userData.exists) {
        _organizers = OrganizerModel.fromSnapshot(userData);
        notifyListeners();
      } else {
        print('Organizer data not found.');
      }
    } else {
      print('No organizer signed in.');
    }
  }

  // Function to update user data
  Future<void> updateOrganizerData(
      String? organizerId, Map<String, dynamic> dataToUpdate) async {
    try {
      await FirebaseFirestore.instance
          .collection("organizationAccount")
          .doc(organizerId)
          .update(dataToUpdate);

      _organizers.organizationName = dataToUpdate['organizationName'] ?? '';
      _organizers.organizationContact =
          dataToUpdate['organizationContact'] ?? '';
      _organizers.organizationAdress = dataToUpdate['organizationAdress'] ?? '';
      _organizers.organizationLink = dataToUpdate['organizationLink'] ?? '';
      _organizers.profileImageLink = dataToUpdate['profileImageLink'] ?? '';
      notifyListeners();
      print('Organizers data succesfully updated');
    } catch (error) {
      print('Error update organizers: $error');
    }
  }

  Future<void> updatePicData(
      String? organizerId, Map<String, dynamic> dataToUpdate) async {
    try {
      await FirebaseFirestore.instance
          .collection("organizationAccount")
          .doc(organizerId)
          .update(dataToUpdate);

      _organizers.picName = dataToUpdate['picName'] ?? '';
      _organizers.picContact = dataToUpdate['picContact'] ?? '';
      _organizers.picIc = dataToUpdate['picIc'] ?? '';
      _organizers.picAdress = dataToUpdate['picAdress'] ?? '';
      _organizers.picEmail = dataToUpdate['picEmail'] ?? '';
      _organizers.picPassword = dataToUpdate['picPassword'] ?? '';
      notifyListeners();
      print('PIC data succesfully updated');
    } catch (error) {
      print('Error update pic: $error');
    }
  }

  Future<void> updatePicMoniterData(
      String? organizerId, Map<String, dynamic> dataToUpdate) async {
    try {
      await FirebaseFirestore.instance
          .collection("organizationAccount")
          .doc(organizerId)
          .update(dataToUpdate);

      _organizers.picName = dataToUpdate['picName'] ?? '';
      _organizers.picContact = dataToUpdate['picContact'] ?? '';
      _organizers.picIc = dataToUpdate['picIc'] ?? '';
      _organizers.picAdress = dataToUpdate['picAdress'] ?? '';
      _organizers.picEmail = dataToUpdate['picEmail'] ?? '';
      _organizers.verify = dataToUpdate['verify'] ?? '';
      notifyListeners();
      print('PIC monitor data succesfully updated');
    } catch (error) {
      print('Error update pic monitor: $error');
    }
  }

  Future<void> fetchAllOrganizers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('organizationAccount')
              .get();

      _organizerList = querySnapshot.docs
          .map((doc) => OrganizerModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching organizers: $error');
    }
  }

  Future<void> updateOrganizerStatus(String? organizerId, String status) async {
    try {
      await FirebaseFirestore.instance
          .collection("organizationAccount")
          .doc(organizerId)
          .update({'verify': status});

      await fetchAllOrganizers();
    } catch (error) {
      print('Error updating organizer status: $error');
    }
  }

  void resetOrganizersDetails() async {
    _organizers = OrganizerModel();
    notifyListeners();
  }
}
