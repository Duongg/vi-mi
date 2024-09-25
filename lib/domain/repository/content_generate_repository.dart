import 'package:dartz/dartz.dart';
import 'package:vi_mi/domain/usecases/content_generate_usecase.dart';

abstract class AbstractContentRepository {
  Future<Either<Failure, String>> generateContent(
      String textContent, String imagePath);
}
