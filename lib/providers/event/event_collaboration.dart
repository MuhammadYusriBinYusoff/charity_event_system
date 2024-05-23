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
    await fetchEventCollaborationData(null);
  }

  void _updateCollaborationData(List<EventCollaborationModel> data) {
    data.sort((a, b) =>
        (int.parse(a.cardId!) ?? 0).compareTo(int.parse(b.cardId!) ?? 0));
    _collaborationDetailsList = data;
    _collaborationDataController.add(data);
    notifyListeners();
  }

  Future<void> createCollaborationDetails(
      EventCollaborationModel newCollaborationDetails,
      String? userId,
      String? selectedOrganizerId) async {
    _collaborationDetails = newCollaborationDetails;

    String eventCollaborationId;
    if (selectedOrganizerId != null) {
      eventCollaborationId = selectedOrganizerId;
    } else {
      eventCollaborationId = userId ?? "";
    }

    await FirebaseFirestore.instance
        .collection("collaboration")
        .doc(eventCollaborationId)
        .collection("list collaboration")
        .doc(newCollaborationDetails.id)
        .set(_collaborationDetails.toJson());
    notifyListeners();
  }

  Future<void> fetchEventCollaborationData(String? selectedOrganizerId) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String eventCollaborationId = selectedOrganizerId ?? user.uid;

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

  Future<void> deleteEventCollaboration(
      String? collaborationId, String? selectedOrganizerId) async {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
      await FirebaseFirestore.instance
          .collection("collaboration")
          .doc(eventCollaborationId)
          .collection("list collaboration")
          .doc(collaborationId)
          .delete();

      notifyListeners();
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

  void updateColumnBelong(
      String itemId, String newColumnBelong, String? selectedOrganizerId) {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }

      FirebaseFirestore.instance
          .collection("collaboration")
          .doc(eventCollaborationId)
          .collection("list collaboration")
          .doc(itemId)
          .update({'columnBelong': newColumnBelong});

      notifyListeners();
    } catch (error) {
      print('Error updating columnBelong: $error');
    }
  }

  void updateTaskDetails(String itemId, String newTitle, String newSubscription,
      String? selectedOrganizerId) {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
      FirebaseFirestore.instance
          .collection("collaboration")
          .doc(eventCollaborationId)
          .collection("list collaboration")
          .doc(itemId)
          .update(
        {
          'title': newTitle,
          'subTitle': newSubscription,
        },
      );

      notifyListeners();
    } catch (error) {
      print('Error updating title,subtitle: $error');
    }
  }

  void updateBackLogDetails(String itemId, String newTitle,
      String newSubscription, String newColumnBelong) {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection("collaboration")
            .doc(user.uid)
            .collection("list collaboration")
            .doc(itemId)
            .update(
          {
            'title': newTitle,
            'subTitle': newSubscription,
            'columnBelong': newColumnBelong,
          },
        );

        notifyListeners();
      }
    } catch (error) {
      print('Error updating title,subtitle: $error');
    }
  }

  void updateTitle(String itemId, String newTitle, String? selectedOrganizerId) {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
        FirebaseFirestore.instance
            .collection("collaboration")
            .doc(eventCollaborationId)
            .collection("list collaboration")
            .doc(itemId)
            .update({'title': newTitle});

        notifyListeners();
      
    } catch (error) {
      print('Error updating title: $error');
    }
  }

  void updateDescription(String itemId, String newDescription, String? selectedOrganizerId) {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
        FirebaseFirestore.instance
            .collection("collaboration")
            .doc(eventCollaborationId)
            .collection("list collaboration")
            .doc(itemId)
            .update({'subTitle': newDescription});

        notifyListeners();
      
    } catch (error) {
      print('Error updating description: $error');
    }
  }

  void updateStoryPoint(String itemId, String newStoryPoint, String? selectedOrganizerId) {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
        FirebaseFirestore.instance
            .collection("collaboration")
            .doc(eventCollaborationId)
            .collection("list collaboration")
            .doc(itemId)
            .update({'storyPoint': newStoryPoint});

        notifyListeners();
    } catch (error) {
      print('Error updating storyPoint: $error');
    }
  }

  Future<void> updateStartDate(String itemId, String newStartDate, String? selectedOrganizerId) async {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
      
        await FirebaseFirestore.instance
            .collection("collaboration")
            .doc(eventCollaborationId)
            .collection("list collaboration")
            .doc(itemId)
            .update({'startDate': newStartDate});

        notifyListeners();
      
    } catch (error) {
      print('Error updating start date: $error');
    }
  }

  Future<void> updateEndDate(
      String itemId, String newEndDate, String? selectedOrganizerId) async {
    try {
      String eventCollaborationId;
      if (selectedOrganizerId != null) {
        eventCollaborationId = selectedOrganizerId;
      } else {
        User? user = FirebaseAuth.instance.currentUser;
        eventCollaborationId = user!.uid;
      }
      await FirebaseFirestore.instance
          .collection("collaboration")
          .doc(eventCollaborationId)
          .collection("list collaboration")
          .doc(itemId)
          .update({'endDate': newEndDate});

      notifyListeners();
    } catch (error) {
      print('Error updating end date: $error');
    }
  }

  void resetCollaborationDetails() {
    _collaborationDetails = EventCollaborationModel();
    notifyListeners();
  }

  void resetCollaborationDetailsList() {
    _collaborationDetailsList = [];
    _collaborationDataController.add(_collaborationDetailsList);
    notifyListeners();
  }

  @override
  void dispose() {
    _collaborationDataController.close();
    super.dispose();
  }
}
