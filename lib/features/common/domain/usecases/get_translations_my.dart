import 'package:charity_event_system/core/core.dart';
import 'package:charity_event_system/features/features.dart';
import 'package:either_dart/either.dart';

class GetTranslationsMY extends UseCase<TranslationsResponse, NoParams> {
  final CommonRepository repository;

  GetTranslationsMY(this.repository);

  @override
  Future<Either<Failure, TranslationsResponse>> call(NoParams params) =>
      repository.translationMY();
}