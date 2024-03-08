import 'package:cloud_firestore/cloud_firestore.dart';

class EventGalleryModel {
  final String? id;
  final List<String>? imageGalleryUrls;

  EventGalleryModel({
    this.id,
    this.imageGalleryUrls,
  });

  static EventGalleryModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventGalleryModel(
      id: snapshot['id'],
      imageGalleryUrls:
          (snapshot['imageGalleryUrls'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "imageGalleryUrls": imageGalleryUrls,
    };
  }
}
