import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerModel{
  final String? id;
  final String? volunteerName;
  final String? volunteerContact;
  final String? volunteerIc;
  final String? volunteerAdress;
  final String? volunteerEmail;
  

  VolunteerModel({
    this.id,
    this.volunteerName,
    this.volunteerContact,
    this.volunteerIc,
    this.volunteerAdress,
    this.volunteerEmail,
  });

  static VolunteerModel fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot){
    return VolunteerModel(
      id: snapshot['id'], 
      volunteerName: snapshot['volunteerName'], 
      volunteerContact: snapshot['volunteerContact'], 
      volunteerIc: snapshot['volunteerIc'],
      volunteerAdress: snapshot['volunteerAdress'], 
      volunteerEmail: snapshot['volunteerEmail'], 
    );
  }

  Map<String, dynamic> toJson() {
  return {
    "id": id,
    "volunteerName": volunteerName,
    "volunteerContact": volunteerContact,
    "volunteerIc": volunteerIc,
    "volunteerAdress": volunteerAdress,
    "volunteerEmail": volunteerEmail,
  };
}

}