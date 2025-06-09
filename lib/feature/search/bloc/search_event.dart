final class SearchEvent {}

final class SearchBtnPressed extends SearchEvent {
  final String search;

  SearchBtnPressed({required this.search});
}

final class SearchResetState extends SearchEvent {}
