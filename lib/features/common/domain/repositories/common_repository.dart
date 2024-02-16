import 'package:charity_event_system/core/core.dart';
import 'package:charity_event_system/features/features.dart';
import 'package:either_dart/either.dart';

abstract class CommonRepository {
  Future<Either<Failure, TranslationsResponse>> translationEN();

  Future<Either<Failure, TranslationsResponse>> translationMY();
}