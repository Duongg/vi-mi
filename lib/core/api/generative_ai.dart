import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vi_mi/core/api/secret.dart';
import 'package:vi_mi/core/api/secret_loader.dart';

class GenerativeAI {
  static Future<Secret> getApiKey =
      SecretLoader(secretPath: "secret.json").load();

  static GenerativeModel getGenerativeModel(String apiKey) {
    return GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      generationConfig: GenerationConfig(temperature: 1.0),
      apiKey: apiKey,
    );
  }

  static Future<String?> generateContent(
      String apiKey, String textContent, String imagePath) async {
    var model = GenerativeAI.getGenerativeModel(apiKey);
    final imageBytes = await File(imagePath).readAsBytes();
    final content = [
      Content.multi([
        TextPart(textContent),
        DataPart('image/png', imageBytes),
      ])
    ];

    final response = await model.generateContent(content);
    return response.text;
  }
}
