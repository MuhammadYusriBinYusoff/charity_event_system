import 'package:charity_event_system/features/features.dart';
import 'package:charity_event_system/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';


final sl = GetIt.instance;

/// initializes all services for use with service locator.
/// [hiveBoxPrefixForTests] is only used for tests so that there will be no file lock issues
Future<void> serviceLocatorSetup({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String hiveBoxPrefixForTests = '',
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  // register dio client ex: ContentStack, Rest API, etc
  _dioClient(isUnitTest: isUnitTest);
  _services();

  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  _resources();
  _helpers();

  /// only initialize hive when not unit testing
  if (isHiveEnable) {
    await _initHiveBoxes(
      hiveBoxPrefixForTests: hiveBoxPrefixForTests,
    );
  }
  await sl.allReady();
}

void _services() {
 
}

Future<void> _initHiveBoxes({String hiveBoxPrefixForTests = ''}) async {
  // Initialize hive (persistent database)
  await Hive.initFlutter();
  await Future.wait([
    HiveTranslationsBoxMixin.initHive(
      prefixForTest: hiveBoxPrefixForTests,
    ),
  ]);

  sl.registerSingletonAsync<HiveMainBoxService>(
    () async {
      final hiveMainBoxService = HiveMainBoxService();
      await hiveMainBoxService.initHive(
        prefixForTest: hiveBoxPrefixForTests,
      );
      return hiveMainBoxService;
    },
  );
  // sl.registerSingleton<HiveTranslationsBoxMixin>(HiveTranslationsBoxMixin());
  // sl.registerSingletonAsync<SSOApiService>(
  //   () async {
  //     final ssoService = SSOApiService();
  //     ssoService.init();
  //     return ssoService;
  //   },
  //   dependsOn: [HiveMainBoxService],
  // );
}

/// Register dio client
void _dioClient({bool isUnitTest = false}) {
  // sl.registerSingleton<DioClientCS>(DioClientCS(isUnitTest: isUnitTest));
  // sl.registerSingleton<DioClientStaticAPI>(
  //   DioClientStaticAPI(isUnitTest: isUnitTest),
  // );
  // sl.registerSingleton<DioClientPdf>(
  //   DioClientPdf(isUnitTest: isUnitTest),
  // );
  // sl.registerSingleton<DioClientClevertap>(
  //   DioClientClevertap(isUnitTest: isUnitTest),
  // );
}

/// Register repositories
void _repositories() {
  
  // sl.registerLazySingleton<CommonRepository>(
  //   () => CommonRepositoryImpl(sl(), sl()),
  // );
}

/// Register dataSources
void _dataSources() {

  /// Local data sources
  sl.registerLazySingleton<CommonLocalDataSource>(
    () => CommonLocalDataSourceImpl(),
  );
}

/// Register useCases
void _useCase() {
  /// Common
  sl.registerLazySingleton(() => GetTranslationsEN(sl()));
  sl.registerLazySingleton(() => GetTranslationsMY(sl()));

}

/// Register cubit
void _cubit() {
 
}

/// Register resources
void _resources() {
  
}

/// Register Helpers
void _helpers() {
  ///Utils Helper
  
}
