part of 'content_generate_bloc.dart';

abstract class ContentGenerateState {
  const ContentGenerateState();
}

class InitialGenerateContentState extends ContentGenerateState {}

class LoadingGenerateContentState extends ContentGenerateState {}

class ErrorGenerateContentState extends ContentGenerateState {
  final String errorMsg;
  ErrorGenerateContentState(this.errorMsg);
}

class SuccessGenerateContentState extends ContentGenerateState {
  final String contentGenerated;
  SuccessGenerateContentState(this.contentGenerated);
}
