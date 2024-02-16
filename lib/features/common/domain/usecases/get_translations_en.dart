
import 'package:charity_event_system/core/core.dart';
import 'package:either_dart/either.dart';
import 'package:charity_event_system/features/features.dart';

class GetTranslationsEN extends UseCase<TranslationsResponse, NoParams> {
  final CommonRepository repository;

  GetTranslationsEN(this.repository);

  @override
  Future<Either<Failure, TranslationsResponse>> call(NoParams params) =>
      repository.translationEN();
}