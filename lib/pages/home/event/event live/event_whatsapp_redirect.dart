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
    final whatsappUrl = Uri.parse(groupLink ??
        "https://www.youtube.com/watch?v=wI1IroOdVvE&list=PLpeOWJ81yOvbxtJWU4z8jzhl_DRjuG1Jv&index=26");
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
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
            child: IconButton(
                icon: const Icon(
                  Icons.phone,
                  size: 200.0,
                  color: Colors.green,
                ),
                onPressed: () async {
                  await _openLink();
                }),
          ),
          SpacerV(value: Dimens.space32),
          Positioned(
            top: Dimens.space100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(45),
              color: Colors.transparent,
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      "Congratulation!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Here our Whatsapp group. Click the icon given",
                      style: TextStyle(fontSize: 16),
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
