import 'dart:async';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/home/homes.dart';
import 'package:charity_event_system/pages/widgets/spacer_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color myColor = const Color(0xFFCB74D9);
  TextStyle splashPageTitleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold, 
    color: Colors.white,
    fontFamily: 'Roboto', 
  );

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const IntroBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        backgroundColor: Palette.purpleMain,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                Images.splashIcon,
                width: 100,
                height: 100,
              ),
            ),
            SpacerV(value: Dimens.space4),
            Text(
              "SpiraCare",
              style: splashPageTitleStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
