import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatefulWidget {
  final int? index;

  const GalleryPage({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    EventDetailsProvider eventDetailsFile =
        Provider.of<EventDetailsProvider>(context);
    EventGalleryProvider eventGalleryFile =
        Provider.of<EventGalleryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.purpleMain,
        title: const Center(child: Text('Gallery')),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Palette.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(Translation.logOutTitle.getString(context)),
                  content: Text(Translation.logOutMsg.getString(context)),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(Translation.cancel.getString(context)),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        eventDetailsFile.resetEventDetails();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(Translation.logout.getString(context)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimens.space8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV(
                value: Dimens.space16,
              ),
              if (widget.index != null &&
                  widget.index! >= 0 &&
                  widget.index! < eventGalleryFile.eventGalleryList.length)
                ImageListWidget(
                  imageAppear: 6.5,
                  imageUrls: eventGalleryFile
                          .eventGalleryList[widget.index!].imageGalleryUrls ??
                      [],
                ),
              SpacerV(
                value: Dimens.space16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
