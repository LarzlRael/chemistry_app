part of 'providers.dart';

final compoundProvider = StateNotifierProvider<CompoundNotifier, CompoundState>(
    (ref) => CompoundNotifier());

class CompoundNotifier extends StateNotifier<CompoundState> {
  CompoundNotifier() : super(CompoundState.initial());

  void setSearched(List<PeriodicTableElement> listPeriodic) {
    state = state.copyWith(searched: listPeriodic);
  }

  void setCompoundSearched(List<Compound> listCompounds) {
    state = state.copyWith(compoundSearched: listCompounds);
  }

  void filterByGroup(Group group) {
    if (group == Group.nullGroup) {
      setSearched(listPeriodic);
    }
    state = state.copyWith(
      compounds:
          listPeriodic.where((element) => element.group == group).toList(),
    );
  }
}

class CompoundState {
  final bool isLoading;
  final List<PeriodicTableElement> peridicElements;
  final List<PeriodicTableElement> searched;
  final List<Compound> compoundSearched;
  final String errorMessage;

  CompoundState({
    this.isLoading = true,
    this.peridicElements = const [],
    this.errorMessage = '',
    this.searched = const [],
    this.compoundSearched = const [],
  });
  factory CompoundState.initial() => CompoundState();

  CompoundState copyWith({
    bool? isLoading,
    List<PeriodicTableElement>? compounds,
    String? errorMessage,
    List<PeriodicTableElement>? searched,
    List<Compound>? compoundSearched,
  }) =>
      CompoundState(
        isLoading: isLoading ?? this.isLoading,
        peridicElements: compounds ?? this.peridicElements,
        errorMessage: errorMessage ?? this.errorMessage,
        searched: searched ?? this.searched,
        compoundSearched: compoundSearched ?? this.compoundSearched,
      );
}
