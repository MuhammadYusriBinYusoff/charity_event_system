import 'dart:async';
import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class EventTransactionProvider extends ChangeNotifier {
  EventTransactionModel _transactionDetails = EventTransactionModel();
  List<EventTransactionModel> _transactionDetailsList = [];

  EventTransactionModel get transactionDetails => _transactionDetails;
  List<EventTransactionModel> get transactionDetailsList =>
      _transactionDetailsList;

  late Stream<List<EventTransactionModel>> transactionDataStream;
  final _transactionDataController =
      StreamController<List<EventTransactionModel>>.broadcast();
  Timer? _debounce;

  EventTransactionProvider() {
    transactionDataStream = _transactionDataController.stream;
    _init();
  }

  void _init() async {
    await fetchEventTransactionData(null);
  }

  void _updateTransactionData(List<EventTransactionModel> data) {
    if (!_areListsEqual(_transactionDetailsList, data)) {
      data.sort((a, b) => a.id!.compareTo(b.id!));
      _transactionDetailsList = data;
      _transactionDataController.add(data);
      notifyListeners();
    }
  }

  bool _areListsEqual(
      List<EventTransactionModel> list1, List<EventTransactionModel> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i].id != list2[i].id) return false;
    }
    return true;
  }

  Future<void> createTransactionDetails(
      EventTransactionModel newTransactionDetails, String? userId) async {
    _transactionDetails = newTransactionDetails;
    await FirebaseFirestore.instance
        .collection("transaction")
        .doc(userId)
        .collection("list transaction")
        .doc(newTransactionDetails.id)
        .set(_transactionDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventTransactionData(String? curr) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      //String eventTransactionId = user.uid;
      String eventTransactionId = curr ?? user.uid;

      FirebaseFirestore.instance
          .collection('transaction')
          .doc(eventTransactionId)
          .collection("list transaction")
          .snapshots()
          .listen((snapshot) {
        // Debounce the updates to avoid frequent UI updates
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          _updateTransactionData(snapshot.docs
              .map((doc) => EventTransactionModel.fromSnapshot(doc))
              .toList());
        });
      });
    } else {
      print('No transaction.');
    }
  }

  Future<void> fetchAllTransactionDetails(String? id) async {
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
      notifyListeners();
    } catch (error) {
      print('Error fetching transaction List: $error');
    }
  }

  Future<void> deleteAllEventTransaction() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("transaction")
            .doc(user.uid)
            .delete();
        notifyListeners();
      }
    } catch (error) {
      print('Error deleting transaction: $error');
    }
  }

  void resetEventTransaction() {
    _transactionDetails = EventTransactionModel();
    notifyListeners();
  }

  @override
  void dispose() {
    _transactionDataController.close();
    _debounce?.cancel();
    super.dispose();
  }
}
