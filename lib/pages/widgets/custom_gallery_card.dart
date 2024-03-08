import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final double imageSize;

  const ImageItem({
    Key? key,
    required this.imageUrl,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimens.space8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.space8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.space8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            height: imageSize,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}