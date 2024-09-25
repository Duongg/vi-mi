import 'package:get_it/get_it.dart';
import 'package:vi_mi/presentation/content_generate_injections.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initContentGenerationInjections();
}
