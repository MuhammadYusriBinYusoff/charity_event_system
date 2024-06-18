import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppPage extends StatelessWidget {
  String? groupLink;
  int? index;

  WhatsAppPage({
    Key? key,
    this.groupLink,
    this.index,
  }) : super(key: key);

  Future<void> _openLink() async {
  const defaultUrl = "https://www.youtube.com/watch?v=wI1IroOdVvE&list=PLpeOWJ81yOvbxtJWU4z8jzhl_DRjuG1Jv&index=26";
  final whatsappUrl = Uri.parse(groupLink ?? defaultUrl);

  try {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      print('Could not launch $whatsappUrl');
    }
  } catch (e) {
    print('Error launching URL: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarcolor: Palette.white,
        hideLogout: true,
        showPreviousButton: false,
        showCustomPreviousButton: true,
        colorCustomPreviousButton: Palette.black,
        targetPage: EventPostingDescriptionPage(
          index: index,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 100.0),
              child: IconButton(
                  icon: Image.asset(
                    Images.whatsappIconPng,
                    width: 177,
                    height: 184,
                  ),
                  onPressed: () async {
                    await _openLink();
                  }),
            ),
          ),
          SpacerV(value: Dimens.space32),
          Positioned(
            top: Dimens.space100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(45),
              color: Colors.transparent,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      Translation.titleWhatsApp.getString(context),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Translation.subTitleWhatsApp.getString(context),
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
