import 'package:charity_event_system/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum MainBoxKeys {
  userData,
  userToken,
  region,
  malaysiaCode,
  lastLoginTime,
  ssoOriginData,
  ssoCredentialData,

  /// will be used to determine if [ssoCredentialData] should be updated
  ssoCredentialDataUpdatedAt,
  ssoUmUsers,
  ssoLifeProfile,
  saveAudioSelection,
  showDialogAfterLogin,
  userAlreadySendParticipate,
  loginUsing,
  webviewDialog,
  recentSearchUmrahGuide,
  userId,
  isNotFreshInstall,
  isLogin,
  splashUmrahGuide,
  listTabUmrahGuide,
  umrahGuideVersion,
  umrahGuideFullDownload,
  ramadhanSubscription,
  generalNotificationStatus,

  // ? prayer time keys
  timezone,
  timezoneId,
  localCity,
  userChoiceCity, // aka USER_CHOICE_CITY
  alarmClockSetting, // aka ALARM_CLOCK
  alarmClockCache, // aka ALARM_CLOCK_CACHE
  alarmClockTime, // aka ALARM_CLOCK_TIME
  homeWidgetDataPrayers,
  prayerTimesSetting,
  prayerTimesSettingCity, // aka PRAYER_TIMES_SETTING_CITY
  prayerTimesSettingCoordinates,
  prayerTimesSettingMethod, // aka PRAYER_TIMES_SETTING_METHOD
  prayerTimesSettingMadhab, // aka PRAYER_TIMES_SETTING_MADHAB
  prayerTimesSettingHighLatitudeRule, // aka PRAYER_TIMES_SETTING_HIGHLATITUDERULE
  prayerTimesSettingAdjustments, // aka PRAYER_TIMES_SETTING_ADJUSTMENTS
  prayerTimesSettingMethodAdjustments, // aka PRAYER_TIMES_SETTING_METHODADJUSTMENTS
  prayerTimesSettingPrayerConventionsIndex, // aka PRAYER_TIMES_SETTING_INDEX
  position,
  currentLocationSelected, // aka CURRENT_LOCATION_SELECTED

  appSettings, // aka APPSETTINGS
  prayerSettings, // prayer settings
  cachedLocation, // aka CACHED_LOCATION
  cachedLocationTimeZone, // aka CACHED_LOCATION_TIME_ZONE
  cachedPrayerMonthTime, // aka CACHED_PRAYER_MONTH_TIME
  cachedPrayerTimesResult, // aka CACHED_PRAYER_TIMES_RESULT
  cachedPrayerTimes, // aka CACHED_PRAYER_TIMES

  showTahajjud,
  showSahur, // aka additionalPrayerVisibility[PrayerType.sahur.name]!
  showImsakPrayer, // aka additionalPrayerVisibility[PrayerType.imsak.name]!
  showDhuhaPrayer,
  showQabliyahSubuh,
  showTarawikh, // aka additionalPrayerVisibility[PrayerType.tarawikh.name]!

  cachedLocalCity, // aka CACHED_LOCAL_CITY

  allHomePageDataEn,
  allHomePageDataMy,
  quranPageCache,
  quranSurahListCacheEnglish,
  quranSurahListCacheMalay,
  quranTranslationLanguage,
  quranLastRead,
  quranBookmark,
  quranEnableTranslation,
  quranFontSize,
  quranTranslationFontSize,
  quranSurahDownloadQueue,

  history,
  azanSoundNotification, // aka AZAN_SOUND_NOTIFICATION
  azanVibrationNotification, // aka AZAN_VIBRATION_NOTIFICATION

  storageDeviceAlreadyOpenKey, // aka STORAGE_DEVICE_ALREADY_OPEN_KEY
  isIbadahVisited,
}

mixin class HiveMainBoxMix {
  HiveMainBoxMix._();

  final mainBox = sl.get<HiveMainBoxService>();

  Future<void> addBoxData<T>(MainBoxKeys key, T value) {
    return mainBox.addData(key, value);
  }

  Future<void> addBoxDataIfNotNull<T>(MainBoxKeys key, T value) =>
      mainBox.addBoxDataIfNotNull(key, value);

  Future<void> removeBoxData(MainBoxKeys key) {
    return mainBox.removeData(key);
  }

  T? getBoxData<T>(MainBoxKeys key) => mainBox.getData(key);

  T? getBoxDataStringKey<T>(String key) => mainBox.getDataStringKey(key);

  bool get isLoginBox => mainBox.getData(MainBoxKeys.isLogin) ?? false;

  Future<bool> containsKeyAndNotNull(MainBoxKeys key) =>
      mainBox.containsKeyAndNotNull(key);
}

class HiveMainBoxService extends IDeviceStorage {
  late final Box mainBox;

  static const boxName = 'ikhlasMainBox';

  /// initializes the hive box for this instance. use [prefixForTest] specifically for testing with
  /// hive so that there will be no file lock issues
  @override
  Future<void> initHive({String prefixForTest = ''}) async {
    mainBox = await Hive.openBox('$prefixForTest$boxName');
  }

  @override
  Future<void> addData<T>(MainBoxKeys key, T value) {
    return mainBox.put(key.name, value);
  }

  Future<void> addDataStringKey<T>(String key, T value) {
    return mainBox.put(key, value);
  }

  @override
  Future<void> addBoxDataIfNotNull<T>(MainBoxKeys key, T value) async {
    if (value == null) return;
    return addData(key, value);
  }

  @override
  bool containsKey(MainBoxKeys key) => mainBox.containsKey(key.name);

  @override
  Future<void> removeData(MainBoxKeys key) {
    return mainBox.delete(key.name);
  }

  Future<void> removeDataStringKey(String key) => mainBox.delete(key);

  @override
  T? getData<T>(MainBoxKeys key) => mainBox.get(key.name);

  T? getDataStringKey<T>(String key) => mainBox.get(key);

  T? getDataStringKeyOrNull<T>(String? key) =>
      key == null ? null : mainBox.get(key);

  bool getBoolStringKeyOr(
    String? key, {
    bool defaultValue = false,
  }) =>
      key == null ? null : mainBox.get(key);

  bool checkAvailable(MainBoxKeys key) {
    return mainBox.containsKey(key.name);
  }

  bool checkAvailableStringKey(String key) {
    return mainBox.containsKey(key);
  }

  @override
  T getDataOr<T>(MainBoxKeys key, T defaultValue) => mainBox.get(
        key.name,
        defaultValue: defaultValue,
      );

  @override
  Future<void> closeMainBox() {
    return mainBox.close();
  }

  bool get isLogin => mainBox.get(MainBoxKeys.isLogin.name) ?? false;

  @override
  Future<bool> containsKeyAndNotNull<T>(MainBoxKeys key) async {
    final containsKey = mainBox.containsKey(key.name);
    if (!containsKey) return false;

    final data = getData(key);
    return data != null;
  }

  @override
  Future<bool> containsStringKeyAndNotNull<T>(String? key) async {
    if (key == null) return false;
    final containsKey = mainBox.containsKey(key);
    if (!containsKey) return false;

    final data = getDataStringKey(key);
    return data != null;
  }
}

abstract class IDeviceStorage {
  // TODO: THIS SHOULD BE A GENERIC NAME INSTEAD OF SPECCING HIVE
  Future<void> initHive();

  Future<void> addData<T>(MainBoxKeys key, T value);

  Future<void> addBoxDataIfNotNull<T>(MainBoxKeys key, T value);

  Future<void> removeData(MainBoxKeys key);

  /// check if the key exists in the device storage
  bool containsKey(MainBoxKeys key);

  T? getData<T>(MainBoxKeys key);

  T? getDataOr<T>(MainBoxKeys key, T or);

  Future<void> closeMainBox();

  Future<bool> containsKeyAndNotNull<T>(MainBoxKeys key);

  Future<bool> containsStringKeyAndNotNull<T>(String? key);
}