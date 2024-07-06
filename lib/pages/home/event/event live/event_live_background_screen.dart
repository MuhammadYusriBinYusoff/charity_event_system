import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

class EventLiveBackgroundPage extends StatefulWidget {
  final int? index;

  const EventLiveBackgroundPage({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<EventLiveBackgroundPage> createState() =>
      _EventLiveBackgroundPageState();
}

class _EventLiveBackgroundPageState extends State<EventLiveBackgroundPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<EventCollaborationProvider>(context);
    EventOrganizationBackgroundProvider eventOrganizationBackground =
        Provider.of<EventOrganizationBackgroundProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimens.space10),
                  child: CachedNetworkImage(
                    imageUrl: eventOrganizationBackground
                            .eventOrganizationBackgroundList[widget.index ?? 0]
                            .photoEventUrl ??
                        'https://www.caspianpolicy.org/no-image.png',
                    width: double.infinity,
                    height: Dimens.space200,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SpacerV(
              value: Dimens.space8,
            ),
            Container(
                padding: EdgeInsets.all(Dimens.space16),
                color: Palette.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translation.background.getString(context),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SpacerV(value: Dimens.space8),
                    Text(
                      eventOrganizationBackground
                              .eventOrganizationBackgroundList[
                                  widget.index ?? 0]
                              .backgroundDescription ??
                          '',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
