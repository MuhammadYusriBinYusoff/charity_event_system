import 'package:charity_event_system/core/core.dart';
import 'package:charity_event_system/features/features.dart';
import 'package:either_dart/either.dart';

// class CommonRepositoryImpl implements CommonRepository {
//   final CommonRemoteDataSource _remoteDataSource;
//   final CommonLocalDataSource _localDataSource;

//   CommonRepositoryImpl(this._remoteDataSource, this._localDataSource);

//   @override
//   Future<Either<Failure, TranslationsResponse>> translationEN() async {
//     /// fetch the data from remote async and save to local storage
//     _remoteDataSource.translationEN().then((value) {
//       return value;
//     });

//     /// if available, return the data
//     final response = await _localDataSource.getTranslationsEN();

//     return response;
//   }

//   @override
//   Future<Either<Failure, TranslationsResponse>> translationMY() async {
//     /// fetch the data from remote async and save to local storage
//     _remoteDataSource.translationMY().then((value) {
//       return value;
//     });

//     /// if available, return the data
//     final response = await _localDataSource.getTranslationsMY();

//     return response;
//   }
// }