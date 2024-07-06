import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class PersonnelProvider extends ChangeNotifier {
  PersonnelModel _personnels = PersonnelModel();
  List<PersonnelModel> _personnelList = [];

  PersonnelModel get personnels  => _personnels ;
  List<PersonnelModel> get personnelList => _personnelList;

  Future<void> createPersonnel(PersonnelModel newPersonnel) async {
    _personnels  = newPersonnel;
    try{
      await FirebaseFirestore.instance
        .collection("personnelAccount")
        .doc(newPersonnel.id)
        .set(_personnels .toJson());
    notifyListeners();
    print("Personnel Data sucessfully created");
    } catch (error) {
      print('Error creating personnel: $error');
    }
  }

  Future<void> fetchPersonnelData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('personnelAccount');
      DocumentSnapshot<Map<String, dynamic>> userData = await usersCollection
          .doc(userId)
          .get() as DocumentSnapshot<Map<String, dynamic>>;

      if (userData.exists) {
        _personnels  = PersonnelModel.fromSnapshot(userData);
        notifyListeners();
      } else {
        print('Personnel data not found.');
      }
    } else {
      print('No personnel user signed in.');
    }
  }

  Future<void> updatePersonnelData(
      String? personnelId, Map<String, dynamic> dataToUpdate) async {
    try{
      await FirebaseFirestore.instance
        .collection("personnelAccount")
        .doc(personnelId)
        .update(dataToUpdate);

    _personnels.personnelName = dataToUpdate['personnelName'] ?? '';
    _personnels.personnelContact = dataToUpdate['personnelContact'] ?? '';
    _personnels.personnelAdress = dataToUpdate['personnelAdress'] ?? '';
    _personnels.personnelEmail = dataToUpdate['personnelEmail'] ?? '';
    _personnels.personnelPassword = dataToUpdate['personnelPassword'] ?? '';
    _personnels.profileImageLink = dataToUpdate['profileImageLink'] ?? '';
    notifyListeners();
    print('Personnel data succesfully updated');
    } catch (error) {
      print('Error update personnel: $error');
    }
  }

  void resetPersonnelsDetails() async{
    _personnels = PersonnelModel();
    notifyListeners();
  }
}