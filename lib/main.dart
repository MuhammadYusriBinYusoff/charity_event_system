import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/home/splash_screen.dart';
import 'package:charity_event_system/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveTranslationsBoxMixin.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      // Define your providers here
      // Example:
      // ChangeNotifierProvider(create: (_) => MyProvider()),
      ChangeNotifierProvider(create: (_) => LanguageModel()),
    ],
    child: ScreenUtilInit(
  designSize: const Size(360, 690),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (_, __) {
    return ValueListenableBuilder(
      valueListenable: HiveTranslationsBoxMixin.translationsBox.listenable(),
      builder: (context, box, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SpiraCare',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          supportedLocales: const [
            Locale('en'),
            Locale('my'),
          ],
          locale: Locale(
            box.get(TranslationsBoxKeys.locale.name, defaultValue: 'en'),
          ),
          home: const SplashScreen(),
        );
      },
    );
  },
  child: const SizedBox.shrink(),
),

  );
}
}
