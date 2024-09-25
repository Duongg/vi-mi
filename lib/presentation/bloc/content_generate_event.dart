part of 'content_generate_bloc.dart';

abstract class ContentGenerateEvent {
  const ContentGenerateEvent();
}

class OnGenerateContentEvent extends ContentGenerateEvent {
  final String textContent;
  final String imagePath;
  final bool isLoading;

  OnGenerateContentEvent(this.textContent, this.imagePath,
      {this.isLoading = true});
}

class SearchContentEvent extends ContentGenerateEvent {
  final String searchValue;

  SearchContentEvent(this.searchValue);
}
