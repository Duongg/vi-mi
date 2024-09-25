import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vi_mi/domain/models/GenerateContentParams.dart';
import 'package:vi_mi/domain/repository/content_generate_repository.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class ContentGenerateUseCase extends UseCase<String, GenerateContentParams> {
  final AbstractContentRepository repository;

  ContentGenerateUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(GenerateContentParams params) async {
    final result =
        await repository.generateContent(params.textContent, params.imagePath);
    return result.fold((l) => Left(l), (r) async {
      return Right(r);
    });
  }
}
