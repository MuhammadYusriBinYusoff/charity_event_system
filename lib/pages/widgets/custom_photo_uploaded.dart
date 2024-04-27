import 'package:charity_event_system/common/resources/resources.dart';
import 'package:flutter/material.dart';

class SinglePhotoAddingButton extends StatelessWidget {
  final double height;
  final double width;
  final String? bannerImageUrl;
  final VoidCallback onPressed;

  const SinglePhotoAddingButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
    this.bannerImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.grey),
        ),
        child: Center(
          child: bannerImageUrl == null || bannerImageUrl == ''
              ? Icon(
                  Icons.cloud_upload,
                  color: Palette.grey,
                  size: height * 0.5,
                )
              : Image.network(
                  bannerImageUrl ?? '',
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
