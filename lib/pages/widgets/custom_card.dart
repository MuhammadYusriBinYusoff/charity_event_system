import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? type;
  final bool? isEventListClicked;
  final int? indexCard;
  final double? valueIndicatorProgress;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    this.imageUrl,
    this.title,
    this.description,
    this.type,
    this.isEventListClicked = false,
    this.indexCard,
    this.valueIndicatorProgress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: Dimens.space250,
        height: Dimens.space280,
        child: Card(
          color: Palette.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(0)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
                  height: Dimens.space150,
                ),
              ),
              Container(
                padding: EdgeInsets.all(Dimens.space8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpacerV(
                      value: Dimens.space8,
                    ),
                    Text(
                      description ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                    SpacerV(
                      value: Dimens.space8,
                    ),
                    ProgressBarIndicator(
                      value: valueIndicatorProgress,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
