import 'dart:async';

import 'package:charity_event_system/core/core.dart';
import 'package:charity_event_system/features/features.dart';
import 'package:hive_flutter/hive_flutter.dart';


enum TranslationsBoxKeys {
  locale,
  translationMY,
  translationEN,
}

mixin class HiveTranslationsBoxMixin {
  static late final Box translationsBox;

  static const boxName = 'ikhlasTranslationsBox';

  static TranslationsResponse? tr;

  static String currentLocale = '';

  static String? _currentTranslation =
      translationsBox.get(TranslationsBoxKeys.locale.name);

  static Future<void> initHive({String prefixForTest = ''}) async {
    // Initialize Hive
  await Hive.initFlutter();
    translationsBox = await Hive.openBox('$prefixForTest$boxName');
    setTranslation();
    Hive.box('$prefixForTest$boxName').listenable().addListener(() {
      /// only update translation when locale changed
      if (_currentTranslation !=
          translationsBox.get(TranslationsBoxKeys.locale.name)) {
        // logger.d(
        //   "TranslationsBox changed "
        //   "${translationsBox.get(TranslationsBoxKeys.locale.name)}",
        // );
        setTranslation();
      }
    });
  }

  Future<void> addTranslationData<T>(TranslationsBoxKeys key, T value) async {
    await translationsBox.put(key.name, value);
  }

  Future<void> removeTranslationData(TranslationsBoxKeys key) async {
    await translationsBox.delete(key.name);
  }

  T getTranslationData<T>(TranslationsBoxKeys key) =>
      translationsBox.get(key.name);

  Future<void> closeTranslationsBox() async {
    await translationsBox.close();
  }

  static Future<TranslationsResponse> setTranslation() async {
    /// check current translation
    _currentTranslation = translationsBox.get(TranslationsBoxKeys.locale.name);

    final translation = _currentTranslation == "my"
        ? await sl<CommonLocalDataSource>().getTranslationsMY()
        : await sl<CommonLocalDataSource>().getTranslationsEN();

    /// ignore: join_return_with_assignment
    tr = translation.right;

    return translation.right;
  }
}