import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

//TODO: YUSRI: Need to continue this later

class OrganizerProvider extends ChangeNotifier {
  OrganizerModel _organizers = OrganizerModel();

  OrganizerModel get organizers => _organizers;

  Future<void> createOrganizer(OrganizerModel newOrganizer) async {
    _organizers = newOrganizer;
    await FirebaseFirestore.instance
        .collection("organizationAccount")
        .doc(newOrganizer.id)
        .set(_organizers.toJson());
    notifyListeners();
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
  Future<void> updateOrganizerData(String? organizerId, Map<String, dynamic> dataToUpdate) async {
    await FirebaseFirestore.instance
        .collection("organizationAccount")
        .doc(organizerId)
        .update(dataToUpdate);
    
    _organizers.organizationName = dataToUpdate['organizationName'] ?? '';
     _organizers.organizationContact = dataToUpdate['organizationContact'] ?? '';
     _organizers.organizationAdress = dataToUpdate['organizationAdress'] ?? '';
     _organizers.organizationLink = dataToUpdate['organizationLink'] ?? '';
     _organizers.profileImageLink = dataToUpdate['profileImageLink'] ?? '';
    notifyListeners();
  }

  /*List<OrganizerModel> organizer = [];

  List<OrganizerModel> get organizers => organizer;

  OrganizerProvider() {}

  // Future<void> addOrganizer(OrganizerModel organizer) async {
  //   await FirebaseFirestore.instance.collection("users").doc(organizer.id).set({
  //     "organizationName": organizer.organizationName,
  //     "organizationContact": organizer.organizationContact,
  //     "organizationAdress": organizer.organizationAdress,
  //     "organizationLink": organizer.organizationLink,
  //     "picName": organizer.picName,
  //     "picContact": organizer.picContact,
  //     "picIc": organizer.picIc,
  //     "picAdress": organizer.picAdress, // corrected "address" spelling
  //     "picEmail": organizer.picEmail,
  //     "picPassword": organizer.picPassword,
  //     "id": organizer.id,
  //   });
  //   notifyListeners();
  // }

  Future<void> createOrganizer(OrganizerModel organizer) async {
    final newUser = OrganizerModel(
      id: organizer.id,
      picName: organizer.picName,
      picContact: organizer.picContact,
      picIc: organizer.picIc,
      picAdress: organizer.picAdress, // corrected "address" spelling
      picEmail: organizer.picEmail,
      picPassword: organizer.picPassword,
      organizationName: organizer.organizationName,
      organizationContact: organizer.organizationContact,
      organizationAdress: organizer.organizationAdress,
      organizationLink: organizer.organizationLink,
    ).toJson();

    await FirebaseFirestore.instance.collection("users").doc(organizer.id).set(newUser);
    organizers.add(newUser as OrganizerModel);
    notifyListeners();
  }
  */
}
