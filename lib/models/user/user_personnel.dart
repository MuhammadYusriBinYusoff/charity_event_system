import 'package:cloud_firestore/cloud_firestore.dart';

class PersonnelModel{
  final String? id;
  final String? personnelName;
  final String? personnelContact;
  final String? personnelAdress;
  final String? personnelEmail;
  final String? personnelPassword;

  PersonnelModel({
    this.id,
    this.personnelName,
    this.personnelContact,
    this.personnelAdress,
    this.personnelEmail,
    this.personnelPassword,
  });

  static PersonnelModel fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot){
    return PersonnelModel(
      id: snapshot['id'], 
      personnelName: snapshot['personnelName'], 
      personnelContact: snapshot['personnelContact'], 
      personnelAdress: snapshot['personnelAdress'], 
      personnelEmail: snapshot['personnelEmail'], 
      personnelPassword: snapshot['personnelPassword']
    );
  }

  Map<String, dynamic> toJson() {
  return {
    "id": id,
    "personnelName": personnelName,
    "personnelContact": personnelContact,
    "personnelAdress": personnelAdress, // Corrected "personnelAdress" to "personnelAddress"
    "personnelEmail": personnelEmail,
    "personnelPassword": personnelPassword,
  };
}

}