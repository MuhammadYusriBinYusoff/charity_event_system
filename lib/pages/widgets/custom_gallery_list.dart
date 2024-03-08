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
    return SingleChildScrollView(
      child: Column(
        children: [
          if (imageUrls != null && imageUrls!.isNotEmpty)
            for (int i = 0; i < (imageUrls!.length); i += 2)
              Row(
                children: [
                  if (imageUrls![i].isNotEmpty)
                    ImageItem(
                      imageUrl: imageUrls![i],
                      imageSize: imageSize,
                    ),
                  SpacerH(value: Dimens.space8,),
                  if (i + 1 < imageUrls!.length && imageUrls![i + 1].isNotEmpty)
                    ImageItem(
                      imageUrl: imageUrls![i + 1],
                      imageSize: imageSize,
                    ),
                ],
              ),
          if (imageUrls == null || imageUrls!.isEmpty)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.space8),
                color: Colors.grey[300], 
              ),
              width: MediaQuery.of(context).size.width * 0.44,
              height: imageSize,
              child: const Center(
                child: Text(
                  'No Images',
                  style: TextStyle(color: Palette.grey),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
