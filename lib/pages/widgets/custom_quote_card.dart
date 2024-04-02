import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuoteCard extends StatelessWidget {
  final String imagePath;
  final String quote;
  final String author;

  const QuoteCard({
    Key? key,
    required this.imagePath,
    required this.quote,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimens.space12),
      padding: EdgeInsets.all(Dimens.space8),
      color: Palette.white,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
          SpacerH(value: Dimens.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quote,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SpacerV(value: Dimens.space4),
                Text(
                  author,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
