import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroBoardingScreen extends StatefulWidget {
  const IntroBoardingScreen({super.key});

  @override
  State<IntroBoardingScreen> createState() => _IntroBoardingScreenState();
}

class _IntroBoardingScreenState extends State<IntroBoardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      pages: [
        PageViewModel(
          title:
              Translation.onBoardingTitle1.getString(context),
          body: Translation.onBoardingSubtitle1.getString(context),
          image: SvgPicture.asset(
            Images.societyIcon,
            height: Dimens.space150,
            fit: BoxFit.cover,
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                color: Palette.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(color: Palette.white, fontSize: 16),
            pageColor: Palette.purpleMain,
          ),
        ),
        PageViewModel(
          title: Translation.onBoardingTitle2.getString(context),
          body:
              Translation.onBoardingSubtitle2.getString(context),
          image: SvgPicture.asset(
            Images.donationIcon,
            height: Dimens.space160,
            fit: BoxFit.cover,
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                color: Palette.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(color: Palette.white, fontSize: 16),
            pageColor: Palette.purpleMain,
          ),
        ),
        PageViewModel(
          title: Translation.onBoardingTitle3.getString(context),
          body:
              Translation.onBoardingSubtitle3.getString(context),
          image: SvgPicture.asset(
            Images.societyIcon,
            height: Dimens.space150,
            fit: BoxFit.cover,
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                color: Palette.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(color: Palette.white, fontSize: 16),
            pageColor: Palette.purpleMain,
          ),
        )
      ],
      showSkipButton: true,
      showNextButton: false,
      skip: Text(Translation.skip.getString(context)),
      done: Text(Translation.done.getString(context)),
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
  }
}
