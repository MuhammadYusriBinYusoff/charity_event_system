import 'package:cloud_firestore/cloud_firestore.dart';

class PersonnelModel {
  final String? id;
  String? personnelName;
  String? personnelContact;
  String? personnelAdress;
  String? personnelEmail;
  String? personnelPassword;
  String? profileImageLink;

  PersonnelModel({
    this.id,
    this.personnelName,
    this.personnelContact,
    this.personnelAdress,
    this.personnelEmail,
    this.personnelPassword,
    this.profileImageLink,
  });

  static PersonnelModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return PersonnelModel(
      id: snapshot['id'],
      personnelName: snapshot['personnelName'],
      personnelContact: snapshot['personnelContact'],
      personnelAdress: snapshot['personnelAdress'],
      personnelEmail: snapshot['personnelEmail'],
      personnelPassword: snapshot['personnelPassword'],
      profileImageLink: snapshot['profileImageLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "personnelName": personnelName,
      "personnelContact": personnelContact,
      "personnelAdress": personnelAdress,
      "personnelEmail": personnelEmail,
      "personnelPassword": personnelPassword,
      "profileImageLink": profileImageLink,
    };
  }
}
