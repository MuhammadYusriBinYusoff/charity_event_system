import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/models/models.dart';
import 'package:charity_event_system/pages/widgets/widgets.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageListWidget extends StatefulWidget {
  final List<String>? imageUrls;
  final double imageSize;
  final double imageAppear;
  final String? session;

  const ImageListWidget({
    Key? key,
    this.imageUrls,
    this.imageSize = 100,
    this.imageAppear = 3.5,
    this.session,
  }) : super(key: key);

  @override
  _ImageListWidgetState createState() => _ImageListWidgetState();
}

class _ImageListWidgetState extends State<ImageListWidget> {
  @override
  Widget build(BuildContext context) {
    OrganizerProvider organizationUser =
        Provider.of<OrganizerProvider>(context);
    EventGalleryProvider eventGalleryFile =
        Provider.of<EventGalleryProvider>(context);

    void removeImageAndUpdateGallery(int index, List<String> imageUrls) {
      setState(() {
        imageUrls.removeAt(index);
      });
      final userUID = organizationUser.organizers.id;
      final newGallery = EventGalleryModel(
        id: userUID,
        imageGalleryUrls: imageUrls,
      );
      eventGalleryFile.updateEventGallery(newGallery);
    }

    return widget.imageUrls != null && widget.imageUrls!.isNotEmpty
        ? SizedBox(
            height: widget.imageSize * widget.imageAppear,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: ((widget.imageUrls!.length) ~/ 2) +
                  ((widget.imageUrls!.length) % 2),
              itemBuilder: (context, index) {
                final int firstIndex = index * 2;
                final int secondIndex = firstIndex + 1;
                return Row(
                  children: [
                    if (firstIndex < widget.imageUrls!.length)
                      Expanded(
                        child: ImageItem(
                          imageUrl: widget.imageUrls![firstIndex],
                          imageUrls: widget.imageUrls,
                          index: firstIndex,
                          imageSize: widget.imageSize,
                          session: widget.session,
                          onDelete: () => removeImageAndUpdateGallery(firstIndex, widget.imageUrls!),
                        ),
                      ),
                    SpacerH(value: Dimens.space8),
                    if (secondIndex < widget.imageUrls!.length)
                      Expanded(
                        child: ImageItem(
                          imageUrl: widget.imageUrls![secondIndex],
                          imageUrls: widget.imageUrls,
                          index: secondIndex,
                          imageSize: widget.imageSize,
                          session: widget.session,
                          onDelete: () => removeImageAndUpdateGallery(secondIndex, widget.imageUrls!),
                        ),
                      ),
                  ],
                );
              },
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: Dimens.space8),
            width: MediaQuery.of(context).size.width * 0.45,
            height: widget.imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.space8),
              color: Colors.grey[300],
            ),
            child: const Center(
              child: Text(
                'No Images',
                style: TextStyle(color: Palette.grey),
              ),
            ),
          );
  }
}
