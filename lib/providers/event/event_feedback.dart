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
    try{
      FirebaseFirestore.instance
        .collection("feedback")
        .doc(newFeedbackDetails.id)
        .collection("list feedback")
        .doc()
        .set(_feedbackDetails.toJson());
    notifyListeners();
    print("Feedback Data sucessfully created");

    } catch (error) {
      print('Error creating feedback: $error');
    }
    
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

  Future<void> moveFeedbackToHistory(String? feedbackId, String docId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("feedback")
          .doc(feedbackId)
          .collection("list feedback")
          .doc(docId)
          .get();

      if (snapshot.exists) {
        await FirebaseFirestore.instance
            .collection("history")
            .doc(feedbackId)
            .collection("list history")
            .doc(docId)
            .set(snapshot.data()!);
      }
    } catch (error) {
      print('Error moving feedback to history: $error');
    }
  }

  Future<void> deleteFeedbackDetails(String? feedbackId) async {
    try {
      // Fetch all documents in the subcollection
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("feedback")
          .doc(feedbackId)
          .collection("list feedback")
          .get();

      // Move each document to the history subcollection and delete it from the list feedback subcollection
      for (var doc in snapshot.docs) {
        await moveFeedbackToHistory(feedbackId, doc.id);
        await FirebaseFirestore.instance
            .collection("feedback")
            .doc(feedbackId)
            .collection("list feedback")
            .doc(doc.id)
            .delete();
      }

      // Remove the feedback details from the local list
      _feedbackDetailsList.removeWhere((feedback) => feedback.id == feedbackId);
      notifyListeners();
    } catch (error) {
      print('Error deleting feedback: $error');
    }
  }

  Future<void> fetchAndStoreScores(int score) async {
    totalScoresList.add(score);
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
    totalScore = ((totalScore / (20 * turns)) * 100).toInt();
    print("Total Current score $totalScore");
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
    _feedbackDetailsList.clear;
    notifyListeners();
  }

  Future<void> resetScoreEventFeedback() async {
    _totalScoresList.clear();
    totalScoresList.clear();
    for(int i = 0; i < totalScoresList.length; i++){
      _totalScoresList.removeAt(i);
      totalScoresList.removeAt(i);

    }
    print("test reset score");
    print(_totalScoresList.length);
    print(totalScoresList.length);
    print("======");
    notifyListeners();
  }
}
