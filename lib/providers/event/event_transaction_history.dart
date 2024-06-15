import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventTransactionProvider extends ChangeNotifier {
  EventTransactionModel _transactionDetails = EventTransactionModel();
  List<EventTransactionModel> _transactionDetailsList = [];

  EventTransactionModel get transactionDetails => _transactionDetails;
  List<EventTransactionModel> get transactionDetailsList => _transactionDetailsList;

  Future<void> createTransactionDetails(EventTransactionModel newTransactionDetails, String? userId) async {
    _transactionDetails = newTransactionDetails;
    FirebaseFirestore.instance
        .collection("transaction")
        .doc(userId)
        .collection("list transaction")
        .doc(newTransactionDetails.id)
        .set(_transactionDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventTransactionData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventTransactionId = user.uid;
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('transaction')
                .doc(eventTransactionId)
                .collection("list transaction")
                .get();

        _transactionDetailsList = querySnapshot.docs
            .map((doc) => EventTransactionModel.fromSnapshot(doc))
            .toList();

        notifyListeners();
      } catch (error) {
        print('Error fetching transaction List: $error');
      }
    } else {
      print('No user signed in.');
    }
  }

  Future<void> fetchAllTransactionDetails(String? id) async {
    print("test");
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('transaction')
              .doc(id)
              .collection("list transaction")
              .get();
      _transactionDetailsList = querySnapshot.docs
          .map((doc) => EventTransactionModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching transaction List: $error');
    }
  }


  void resetEventTransaction() async{
    _transactionDetails = EventTransactionModel();
    notifyListeners();
  }
  
}