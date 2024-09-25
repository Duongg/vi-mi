import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vi_mi/core/api/generative_ai.dart';
import 'package:vi_mi/domain/repository/content_generate_repository.dart';
import 'package:vi_mi/domain/usecases/content_generate_usecase.dart';

class ContentGenerateRepositoryImpl extends AbstractContentRepository {
  @override
  Future<Either<Failure, String>> generateContent(
      String textContent, String imagePath) async {
    var apiKey = "";
    await GenerativeAI.getApiKey.then((value) => {apiKey = value.apiKey});
    try {
      final result = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        generationConfig: GenerationConfig(temperature: 1.0),
        apiKey: apiKey,
      );
      final imageBytes = await File(imagePath).readAsBytes();
      final content = [
        Content.multi([
          TextPart(textContent),
          DataPart('image/png', imageBytes),
        ])
      ];
      var response = "";
      await result
          .generateContent(content)
          .then((value) => response = value.text.toString());
      return Right(response);
    } on Exception {
      return Left(const GenerateFailure("Error Generated"));
    }
  }
}
