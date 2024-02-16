import 'dart:convert';

import 'package:charity_event_system/core/core.dart';
import 'package:charity_event_system/features/features.dart';
import 'package:charity_event_system/utils/utils.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';

abstract class CommonLocalDataSource {
  Either<Failure, String> setTranslationEN(Map<String, dynamic> json);

  Future<Either<Failure, TranslationsResponse>> getTranslationsEN();

  Either<Failure, String> setTranslationMY(Map<String, dynamic> json);

  Future<Either<Failure, TranslationsResponse>> getTranslationsMY();
}

class CommonLocalDataSourceImpl
    with HiveTranslationsBoxMixin
    implements CommonLocalDataSource {
  @override
  Future<Either<Failure, TranslationsResponse>> getTranslationsEN() async {
    try {
      if (getTranslationData<String?>(TranslationsBoxKeys.translationEN) !=
          null) {
        final isolateParse = IsolateParser(
          jsonDecode(
            getTranslationData<String>(TranslationsBoxKeys.translationEN),
          ) as Map<String, dynamic>,
          (response) => TranslationsResponse.fromJson(
            response as Map<String, dynamic>,
          ),
        );

        return Right(await isolateParse.parseInBackground());
      } else {
        /// load from assets
        final en = await rootBundle.loadString("assets/static_api/en-gb.json");
        final isolateParse = IsolateParser(
          jsonDecode(en) as Map<String, dynamic>,
          (response) => TranslationsResponse.fromJson(
            response as Map<String, dynamic>,
          ),
        );

        return Right(await isolateParse.parseInBackground());
      }
    } catch (_) {
      return Left(NoDataFailure());
    }
  }

  @override
  Future<Either<Failure, TranslationsResponse>> getTranslationsMY() async {
    try {
      if (getTranslationData<String?>(TranslationsBoxKeys.translationMY) !=
          null) {
        final isolateParse = IsolateParser(
          jsonDecode(
            getTranslationData<String>(TranslationsBoxKeys.translationMY),
          ) as Map<String, dynamic>,
          (response) => TranslationsResponse.fromJson(
            response as Map<String, dynamic>,
          ),
        );

        return Right(await isolateParse.parseInBackground());
      } else {
        /// load from assets
        final my = await rootBundle.loadString("assets/static_api/ms-my.json");
        final isolateParse = IsolateParser(
          jsonDecode(my) as Map<String, dynamic>,
          (response) => TranslationsResponse.fromJson(
            response as Map<String, dynamic>,
          ),
        );

        return Right(await isolateParse.parseInBackground());
      }
    } catch (_) {
      return Left(NoDataFailure());
    }
  }

  @override
  Either<Failure, String> setTranslationEN(Map<String, dynamic> json) {
    try {
      addTranslationData(TranslationsBoxKeys.translationEN, jsonEncode(json));
      return const Right('Success');
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Either<Failure, String> setTranslationMY(Map<String, dynamic> json) {
    try {
      addTranslationData(TranslationsBoxKeys.translationMY, jsonEncode(json));
      return const Right('Success');
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}