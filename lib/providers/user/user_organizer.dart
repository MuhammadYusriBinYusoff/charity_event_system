import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

//TODO: YUSRI: Need to continue this later

class OrganizerProvider extends ChangeNotifier {
  List<OrganizerModel> organizer = [];

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
}
