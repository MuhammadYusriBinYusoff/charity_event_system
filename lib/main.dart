import 'dart:io';

import 'package:charity_event_system/common/resources/resources.dart';
import 'package:charity_event_system/pages/home/splash_screen.dart';
import 'package:charity_event_system/pages/localization/locales.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'providers/user/user.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC_F9Oo1xbH3LkFtU1CCGzH7yyBu8xJqK0",
          appId: "1:576604151770:web:96e83733fdabc60878eae3",
          messagingSenderId: "576604151770",
          projectId: "charity-event-cems"),
    );
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBgcuSX1pc9vGhK3oBwXMqLXc3nzhUXGkE",
          appId: "1:576604151770:android:29bec06e84ecb5f778eae3",
          messagingSenderId: "576604151770",
          projectId: "charity-event-cems"),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCAO2135TE70U5dQZQPl65UvyTzsS618Pg",
          appId: "1:576604151770:ios:d52ffff2b08ac50578eae3",
          messagingSenderId: "576604151770",
          projectId: "charity-event-cems"),
    );
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => OrganizerProvider(),
      child: const MyApp(),
    ),
  );
  //runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configureLocalization();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SpiraCare',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Palette.purpleMain),
            useMaterial3: true,
          ),
          supportedLocales: localization.supportedLocales,
          localizationsDelegates: localization.localizationsDelegates,
          home: const SplashScreen(),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "my");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }
}
