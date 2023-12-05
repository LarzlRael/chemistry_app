part of 'providers.dart';

class CompoundsProvider with ChangeNotifier {
  CompoundState compoundState = CompoundState.initial();

  void setSearched(List<PeriodicTableElement> elements) {
    compoundState = compoundState.copyWith(searched: elements);
    notifyListeners();
  }
}

class CompoundState {
  final bool isLoading;
  final List<PeriodicTableElement> compounds;
  final List<PeriodicTableElement> searched;
  final String errorMessage;

  CompoundState({
    this.isLoading = true,
    this.compounds = const [],
    this.errorMessage = '',
    this.searched = const [],
  });
  factory CompoundState.initial() => CompoundState();

  CompoundState copyWith({
    bool? isLoading,
    List<PeriodicTableElement>? compounds,
    String? errorMessage,
    List<PeriodicTableElement>? searched,
  }) =>
      CompoundState(
        isLoading: isLoading ?? this.isLoading,
        compounds: compounds ?? this.compounds,
        errorMessage: errorMessage ?? this.errorMessage,
        searched: searched ?? this.searched,
      );
}
