import 'dart:io';
import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EventGalleryPage extends StatefulWidget {
  final List<String>? imageUrlList;
  final String? session;
  final EventDetailsModel? newEvent;

  const EventGalleryPage({
    Key? key,
    this.imageUrlList,
    this.session,
    this.newEvent,
  }) : super(key: key);

  @override
  _EventGalleryPageState createState() => _EventGalleryPageState();
}

class _EventGalleryPageState extends State<EventGalleryPage> {
  String? bannerImageUrl;
  List<String>? bannerImageUrlList;
  bool isLoading = false;

   @override
    void initState() {
      super.initState();
      bannerImageUrlList = widget.imageUrlList;
    }

  Future<List<XFile>> pickMultipleImages() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile>? file = await imagePicker.pickMultiImage();

    for (var image in file) {
      print('Image path: ${image.path}');
    }
    return file;
  }

  Future<void> uploadImages(List<XFile> files, String? userId) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceRoot.child('eventGalleryImage').child(userId ?? '');

    try {
      setState(() {
        isLoading = true;
      });

      for (var file in files) {
        Reference referenceImageToUpload = referenceDirImages.child(file.name);
        await referenceImageToUpload.putFile(File(file.path));
      }

      List<String> downloadUrls = [];
      for (var file in files) {
        Reference referenceImageToUpload = referenceDirImages.child(file.name);
        String url = await referenceImageToUpload.getDownloadURL();
        downloadUrls.add(url);
      }

      bannerImageUrlList = downloadUrls;

      setState(() {
        bannerImageUrl = downloadUrls.isNotEmpty ? downloadUrls[0] : null;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventGalleryProvider eventGalleryFile =
        Provider.of<EventGalleryProvider>(context);

    return Scaffold(
      backgroundColor: Palette.lightGrey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const QuoteCard(
              imagePath: Images.societyIcon,
              quote:
                  "All of you are shepherds and each of you is responsible for his flock.",
              author: "- Hadis Riwayat Al-Bukhari",
            ),
            Container(
              padding: EdgeInsets.all(Dimens.space16),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Translation.galleryInfoTitle.getString(context),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Translation.galleryInfoSub.getString(context),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SpacerV(value: Dimens.space16),
                  Text(
                    Translation.uploadGalleryImage.getString(context),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space8,
                  ),
                  SinglePhotoAddingButton(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: Dimens.space100,
                    onPressed: () async {
                      List<XFile> file = await pickMultipleImages();
            
                      if (file.isNotEmpty) {
                        await uploadImages(file, organizationUser.organizers.id);
                      }
                    },
                  ),
                  SpacerV(value: Dimens.space24),
                  Text(
                    Translation.showGalleryImage.getString(context),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpacerV(
                    value: Dimens.space8,
                  ),
                  ImageListWidget(imageUrls: bannerImageUrlList,session: widget.session,),
                  SpacerV(value: Dimens.space24),
                  SizedBox(
                    width: double.infinity,
                    height: Dimens.space40,
                    child: widget.session == "update"
                    ? ElevatedButton(
                      onPressed: () async {
                        final userUID = organizationUser.organizers.id;
                        final newGallery = EventGalleryModel(
                          id: userUID,
                          imageGalleryUrls: bannerImageUrlList,
                        );
            
                        eventGalleryFile.updateEventGallery(newGallery);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.purpleMain,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.space8),
                        ),
                      ),
                      child: Text(
                        Translation.save.getString(context),
                        style: const TextStyle(
                            color: Palette.white),
                      ),
                    ) : ElevatedButton(
                      onPressed: () async {
                        //Note: Comment kejap untuk buat item
                        final userUID = organizationUser.organizers.id;
                        final newGallery = EventGalleryModel(
                          id: userUID,
                          imageGalleryUrls: bannerImageUrlList,
                        );

                        eventGalleryFile.createEventGallery(newGallery);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventItemAddPage(session: 'none',newEvent:widget.newEvent),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.purpleMain,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.space8),
                        ),
                      ),
                      child: Text(
                        Translation.next.getString(context),
                        style: const TextStyle(
                            color: Palette.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
