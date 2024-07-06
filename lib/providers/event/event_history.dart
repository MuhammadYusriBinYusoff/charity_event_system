import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventHistoryProvider extends ChangeNotifier {
  EventHistoryModel _historyDetails = EventHistoryModel();
  List<EventHistoryModel> _historyDetailsList = [];
  final List<int> _totalScoresList = [];

  EventHistoryModel get historyDetails => _historyDetails;
  List<EventHistoryModel> get historyDetailsList => _historyDetailsList;
  List<int> get totalScoresList => _totalScoresList;

  Future<void> createHistoryDetails(
      EventHistoryModel newHistoryDetails) async {
    _historyDetails = newHistoryDetails;
    try{
      FirebaseFirestore.instance
        .collection("history")
        .doc(newHistoryDetails.id)
        .collection("list history")
        .doc()
        .set(_historyDetails.toJson());
    notifyListeners();
    print("History Data sucessfully created");
    } catch (error) {
      print('Error creating history: $error');
    }
  }

  Future<bool> fetchAllHistoryDetails(String? id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('history')
              .doc(id)
              .collection("list history")
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        _historyDetailsList = querySnapshot.docs
            .map((doc) => EventHistoryModel.fromSnapshot(doc))
            .toList();
      }
      return true;
    } catch (error) {
      print('Error fetching history List: $error');
      return false;
    }
  }



  Future<void> fetchAndStoreScores(int score) async {
    _totalScoresList.add(score);
    notifyListeners();
  }

  int getTotalCurrentScore() {
    int totalScore = 0;
    int turns = 0;
    for (var history in historyDetailsList) {
      if (history.currentScoreCollected != null) {
        totalScore += history.currentScoreCollected!;
        turns++;
      }
    }
    if (turns == 0) {
    return 0; // or some other default value
    }
    totalScore = ((totalScore / (20 * turns)) * 100).toInt();
    print("Total history score $totalScore");
    return totalScore;
  }

  List<String> getComments() {
    List<String> comments = [];
    for (var history in historyDetailsList) {
      if (history.comment != null) {
        comments.add(history.comment!);
      }
    }
    return comments;
  }

  void resetEventHistory() async {
    _historyDetails = EventHistoryModel();
    _historyDetailsList = [];
    notifyListeners();
  }

  Future<void> resetScoreEventHistory() async {
    _totalScoresList.clear();
    // print("test reset score");
    // print(_totalScoresList.length);
    // print("======");
    notifyListeners();
  }
}