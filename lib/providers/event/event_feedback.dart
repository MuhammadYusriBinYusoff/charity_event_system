import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventFeedbackProvider extends ChangeNotifier {
  EventFeedbackModel _feedbackDetails = EventFeedbackModel();
  List<EventFeedbackModel> _feedbackDetailsList = [];

  EventFeedbackModel get feedbackDetails => _feedbackDetails;
  List<EventFeedbackModel> get feedbackDetailsList => _feedbackDetailsList;

  Future<void> createFeedbackDetails(EventFeedbackModel newFeedbackDetails) async {
    _feedbackDetails = newFeedbackDetails;
    FirebaseFirestore.instance
        .collection("feedback")
        .doc(newFeedbackDetails.id)
        .collection("list feedback")
        .doc()
        .set(_feedbackDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchAllFeedbackDetails(String? id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('feedback')
              .doc(id)
              .collection("list feedback")
              .get();
      _feedbackDetailsList = querySnapshot.docs
          .map((doc) => EventFeedbackModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print('Error fetching feedback List: $error');
    }
  }
  
}