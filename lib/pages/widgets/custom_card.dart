import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final double? valueIndicatorProgress;
  final VoidCallback? onTap;

  const ProductCard({
    super.key, 
    this.imageUrl,
    this.title,
    this.description,
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
            borderRadius: BorderRadius.circular(0), // Rounded corners for the card
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
                child: Image.network(
                  imageUrl ?? '',
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
                    const SpacerV(value: 8.0,),
                    Text(
                      description ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SpacerV(value: 8.0,),
                    ProgressBarIndicator(value: valueIndicatorProgress,),
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

