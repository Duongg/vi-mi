import 'package:vi_mi/core/injections.dart';
import 'package:vi_mi/domain/repository/content_generate_repository.dart';
import 'package:vi_mi/domain/repository/content_generate_repository_impl.dart';
import 'package:vi_mi/domain/usecases/content_generate_usecase.dart';

initContentGenerationInjections() {
  sl.registerSingleton<AbstractContentRepository>(
      ContentGenerateRepositoryImpl());

  sl.registerSingleton<ContentGenerateUseCase>(ContentGenerateUseCase(sl()));
}
