import 'package:cloud_firestore/cloud_firestore.dart';

class OrganizerModel{
  final String? id;
  final String? picName;
  final String? picContact;
  final String? picIc;
  final String? picAdress;
  final String? picEmail;
  final String? picPassword;
  final String? organizationName;
  final String? organizationContact;
  final String? organizationAdress;
  final String? organizationLink;
  final String? profileImageLink;

  OrganizerModel({
    this.id,
    this.picName,
    this.picContact,
    this.picIc,
    this.picAdress,
    this.picEmail,
    this.picPassword,
    this.organizationName,
    this.organizationContact,
    this.organizationAdress,
    this.organizationLink,
    this.profileImageLink,
  });

  static OrganizerModel fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot){
    return OrganizerModel(
      id: snapshot['id'], 
      picName: snapshot['picName'], 
      picContact: snapshot['picContact'], 
      picIc: snapshot['picIc'], 
      picAdress: snapshot['picAdress'], 
      picEmail: snapshot['picEmail'], 
      picPassword: snapshot['picPassword'],
      organizationName: snapshot['organizationName'],
      organizationContact: snapshot['organizationContact'],  
      organizationAdress: snapshot['organizationAdress'],
      organizationLink: snapshot['organizationLink'],
      profileImageLink: snapshot['profileImageLink'],
    );
  }

  Map<String, dynamic> toJson() {
  return {
    "id": id,
    "picName": picName,
    "picContact": picContact,
    "picIc": picIc,
    "picAdress": picAdress,
    "picEmail": picEmail,
    "picPassword": picPassword,
    "organizationName": organizationName,
    "organizationContact": organizationContact,
    "organizationAdress": organizationAdress,
    "organizationLink": organizationLink,
    "profileImageLink": profileImageLink,
  };
}

}