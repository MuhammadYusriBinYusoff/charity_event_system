import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HomePhotoView extends StatefulWidget {
  final List<String?>? urls;
  final int start;
  final bool canSave;
  final VoidCallback? callback;

  const HomePhotoView({
    super.key,
    required this.urls,
    this.callback,
    this.start = 0,
    this.canSave = false,
  });

  @override
  State<HomePhotoView> createState() => _HomePhotoViewState();
}

class _HomePhotoViewState extends State<HomePhotoView> {
  PageController? pageController;
  late int index;

  @override
  void initState() {
    index = widget.start;
    pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "${index + 1}/${widget.urls!.length}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Palette.white,
            ),
          ),
        ),
        backgroundColor: Palette.black,
        iconTheme: const IconThemeData(
          color: Palette.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (context, index) => PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(
                  widget.urls![index]!,
                ),
              ),
              itemCount: widget.urls!.length,
              loadingBuilder: (context, e) => Stack(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: CachedNetworkImage(
                      imageUrl: widget.urls![index]!,
                    ),
                  ),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: Dimens.space50,
                      height: Dimens.space50,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(
                          Palette.purpleMain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundDecoration: const BoxDecoration(
                color: Palette.black,
              ),
              pageController: pageController,
              onPageChanged: (int i) {
                setState(() {
                  index = i;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
