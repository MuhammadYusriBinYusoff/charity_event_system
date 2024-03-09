import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ImageListWidget extends StatelessWidget {
  final List<String>? imageUrls;
  final double imageSize;

  const ImageListWidget({
    Key? key,
    this.imageUrls,
    this.imageSize = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrls != null && imageUrls!.isNotEmpty
        ? SizedBox(
          height:imageSize * 3.5,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: ((imageUrls!.length) ~/ 2) + ((imageUrls!.length) % 2),
              itemBuilder: (context, index) {
                final int firstIndex = index * 2;
                final int secondIndex = firstIndex + 1;
                return Row(
                  children: [
                    if (firstIndex < imageUrls!.length)
                      Expanded(
                        child: ImageItem(
                          imageUrl: imageUrls![firstIndex],
                          imageSize: imageSize,
                        ),
                      ),
                    SpacerH(value: Dimens.space8),
                    if (secondIndex < imageUrls!.length)
                      Expanded(
                        child: ImageItem(
                          imageUrl: imageUrls![secondIndex],
                          imageSize: imageSize,
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
          height: imageSize,
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


