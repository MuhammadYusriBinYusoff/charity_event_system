import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final double imageSize;
  final int index;
  final List<String>? imageUrls;

  const ImageItem({
    Key? key,
    required this.imageUrl,
    required this.imageSize,
    required this.index,
    this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePhotoView(urls: imageUrls, start: index,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimens.space8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.space4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.space8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            height: imageSize,
            child: imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : const Center(
                    child: Text(
                      'No Image',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
