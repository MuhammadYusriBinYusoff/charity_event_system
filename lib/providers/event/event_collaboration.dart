import 'dart:async';
import 'package:charity_event_system/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventCollaborationProvider extends ChangeNotifier {
  EventCollaborationModel _collaborationDetails = EventCollaborationModel();
  List<EventCollaborationModel> _collaborationDetailsList = [];

  EventCollaborationModel get collaborationDetails => _collaborationDetails;
  List<EventCollaborationModel> get collaborationDetailsList =>
      _collaborationDetailsList;

  late Stream<List<EventCollaborationModel>> collaborationDataStream;
  final _collaborationDataController =
      StreamController<List<EventCollaborationModel>>.broadcast();

  EventCollaborationProvider() {
    collaborationDataStream = _collaborationDataController.stream;
    _init();
  }

  void _init() async {
    await fetchEventCollaborationData();
  }

  void _updateCollaborationData(List<EventCollaborationModel> data) {
    _collaborationDetailsList = data;
    _collaborationDataController.add(data);
  }

  Future<void> createCollaborationDetails(
      EventCollaborationModel newCollaborationDetails, String? userId) async {
    _collaborationDetails = newCollaborationDetails;
    await FirebaseFirestore.instance
        .collection("collaboration")
        .doc(userId)
        .collection("list collaboration")
        .doc(newCollaborationDetails.id)
        .set(_collaborationDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventCollaborationData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventCollaborationId = user.uid;
      FirebaseFirestore.instance
          .collection('collaboration')
          .doc(eventCollaborationId)
          .collection("list collaboration")
          .snapshots()
          .listen((snapshot) {
        _updateCollaborationData(snapshot.docs
            .map((doc) => EventCollaborationModel.fromSnapshot(doc))
            .toList());
      });
    } else {
      print('No user signed in.');
    }
  }

  Future<void> deleteEventCollaboration(String? collaborationId) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("collaboration")
            .doc(user.uid)
            .collection("list collaboration")
            .doc(collaborationId)
            .delete();

        notifyListeners();
      }
    } catch (error) {
      print('Error deleting task: $error');
    }
  }

  Future<void> updateEventCollaboration(
      EventCollaborationModel updatedCollaboration) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("collaboration")
            .doc(user.uid)
            .collection("list collaboration")
            .doc(updatedCollaboration.id)
            .update(updatedCollaboration.toJson());

        notifyListeners();
      }
    } catch (error) {
      print('Error updating task data: $error');
    }
  }

  void updateColumnBelong(String itemId, String newColumnBelong) {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection("collaboration")
            .doc(user.uid)
            .collection("list collaboration")
            .doc(itemId)
            .update({'columnBelong': newColumnBelong});

        notifyListeners();
      }
    } catch (error) {
      print('Error updating columnBelong: $error');
    }
  }

  void updateTaskDetails(String itemId, String newTitle, String newSubscription) {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection("collaboration")
            .doc(user.uid)
            .collection("list collaboration")
            .doc(itemId)
            .update({
              'title': newTitle,
              'subTitle': newSubscription,
              },);

        notifyListeners();
      }
    } catch (error) {
      print('Error updating title,subtitle: $error');
    }
  }

  @override
  void dispose() {
    _collaborationDataController.close();
    super.dispose();
  }
}
