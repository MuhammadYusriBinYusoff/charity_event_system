import 'package:cloud_firestore/cloud_firestore.dart';

class EventHistoryModel {
  final String? id;
  final int? responsibilityScore;
  final int? updateGalleryScore;
  final int? informationUptoDateScore;
  final int? recommendationScore;
  final int? currentScoreCollected;
  final String? comment;

  EventHistoryModel({
    this.id,
    this.responsibilityScore,
    this.updateGalleryScore,
    this.informationUptoDateScore,
    this.recommendationScore,
    this.currentScoreCollected,
    this.comment,
  });

  static EventHistoryModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventHistoryModel(
      id: snapshot['id'],
      responsibilityScore: snapshot['responsibilityScore'],
      updateGalleryScore: snapshot['updateGalleryScore'],
      informationUptoDateScore: snapshot['informationUptoDateScore'],
      recommendationScore: snapshot['recommendationScore'],
      currentScoreCollected: snapshot['currentScoreCollected'],
      comment: snapshot['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "responsibilityScore": responsibilityScore,
      "updateGalleryScore": updateGalleryScore,
      "informationUptoDateScore": informationUptoDateScore,
      "recommendationScore": recommendationScore,
      "currentScoreCollected": currentScoreCollected,
      "comment": comment,
    };
  }
}