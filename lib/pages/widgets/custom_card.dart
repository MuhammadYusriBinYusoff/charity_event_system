import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ProductCard extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? type;
  final bool? isEventListClicked;
  final int? indexCard;
  final int? totalScore;
  final bool? displayPercentageScore;
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
    this.totalScore = 0,
    this.displayPercentageScore = true,
    this.valueIndicatorProgress,
    this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final centerTextStyle = const TextStyle(
    fontSize: 10,
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
  );
  late ValueNotifier<double> valueNotifier;
  late ValueNotifier<double> valueNotifier2;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(40);
    valueNotifier2 = ValueNotifier((widget.totalScore ?? 0).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: Dimens.space250,
        height: Dimens.space260,
        child: Stack(
          children: [
            Card(
              color: Palette.white,
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl ?? '',
                      fit: BoxFit.fill,
                      height: Dimens.space130,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimens.space8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SpacerV(
                          value: Dimens.space8,
                        ),
                        Text(
                          widget.description ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                        SpacerV(
                          value: Dimens.space8,
                        ),
                        ProgressBarIndicator(
                          value: widget.valueIndicatorProgress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if(widget.displayPercentageScore ?? true)
            Positioned(
              left: MediaQuery.of(context).size.width *
                  0.47,
              top: (MediaQuery.of(context).size.height * 0.006),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserFeedbackScore(totalScore: widget.totalScore,)),
                ),
                child: CustomStatisticCard(
                  backStrock: 10,
                  progressStrock: 10,
                  removeBackground: true,
                  adjustBackgroundCircle: true,
                  size: 40,
                  valueNotifier: valueNotifier2,
                  centerTextStyle: centerTextStyle,
                  statisticText: Translation.overallScore.getString(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
