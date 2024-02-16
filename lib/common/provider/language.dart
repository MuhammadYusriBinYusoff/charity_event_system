import 'package:charity_event_system/utils/utils.dart';
import 'package:flutter/foundation.dart';

class LanguageModel extends ChangeNotifier with HiveTranslationsBoxMixin {
  late String? _locale = getTranslationData(TranslationsBoxKeys.locale);

  void changeLanguage(String locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}