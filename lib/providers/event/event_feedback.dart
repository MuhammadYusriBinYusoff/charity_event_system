import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventFeedbackProvider extends ChangeNotifier {
  EventFeedbackModel _feedbackDetails = EventFeedbackModel();
  List<EventFeedbackModel> _feedbackDetailsList = [];
  final List<int> _totalScoresList = [];

  EventFeedbackModel get feedbackDetails => _feedbackDetails;
  List<EventFeedbackModel> get feedbackDetailsList => _feedbackDetailsList;
  List<int> get totalScoresList => _totalScoresList;

  Future<void> createFeedbackDetails(
      EventFeedbackModel newFeedbackDetails) async {
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

      if (querySnapshot.docs.isNotEmpty) {
        _feedbackDetailsList = querySnapshot.docs
            .map((doc) => EventFeedbackModel.fromSnapshot(doc))
            .toList();
      }
    } catch (error) {
      print('Error fetching feedback List: $error');
    }
  }

  Future<void> fetchAndStoreScores(int score) async {
    _totalScoresList.add(score);
    //print("Current Score Length");
    // print(_totalScoresList.length);
    notifyListeners();
  }

  int getTotalCurrentScore() {
    int totalScore = 0;
    int turns = 0;
    for (var feedback in feedbackDetailsList) {
      if (feedback.currentScoreCollected != null) {
        totalScore += feedback.currentScoreCollected!;
        turns++;
      }
    }
    // print("total score before");
    // print(totalScore);
    // print(turns);
    totalScore = ((totalScore / (20 * turns)) * 100).toInt();
    // print("total score after");
    // print(totalScore);
    // print(turns);
    return totalScore;
  }

  List<String> getComments() {
    List<String> comments = [];
    for (var feedback in feedbackDetailsList) {
      if (feedback.comment != null) {
        comments.add(feedback.comment!);
      }
    }
    return comments;
  }

  void resetEventFeedback() async {
    _feedbackDetails = EventFeedbackModel();
    _feedbackDetailsList = [];
    notifyListeners();
  }

  Future<void> resetScoreEventFeedback() async {
    _totalScoresList.clear();
    // print("test reset score");
    // print(_totalScoresList.length);
    // print("======");
    notifyListeners();
  }
}
