import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vi_mi/domain/models/GenerateContentParams.dart';
import 'package:vi_mi/domain/usecases/content_generate_usecase.dart';
part 'content_generate_state.dart';
part 'content_generate_event.dart';

class ContentGenerateBloc
    extends Bloc<ContentGenerateEvent, ContentGenerateState> {
  final ContentGenerateUseCase contentGenerateUseCase;
  String contentGenerated = "";

  ContentGenerateBloc({required this.contentGenerateUseCase})
      : super(InitialGenerateContentState()) {
    on<OnGenerateContentEvent>(_onGenerateContentEvent);
  }

  _onGenerateContentEvent(OnGenerateContentEvent event,
      Emitter<ContentGenerateState> emitter) async {
    if (event.isLoading) {
      emitter(LoadingGenerateContentState());
    }
    final result = await contentGenerateUseCase
        .call(GenerateContentParams(event.textContent, event.imagePath));
    result.fold((l) {
      emitter(ErrorGenerateContentState(l.errorMessage));
    }, (r) {
      contentGenerated = r;
      emitter(SuccessGenerateContentState(contentGenerated));
    });
  }
}
