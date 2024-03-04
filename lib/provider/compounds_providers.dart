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
      setSearched(allListPeriodic);
    }
    state = state.copyWith(
      compounds:
          allListPeriodic.where((element) => element.group == group).toList(),
    );
  }
}

class CompoundState {
  final bool isLoading;
  final List<PeriodicTableElement> periodicElements;
  final List<PeriodicTableElement> elementSearchList;
  final List<Compound> compoundSearched;
  final String errorMessage;

  CompoundState({
    this.isLoading = true,
    this.periodicElements = const [],
    this.errorMessage = '',
    this.elementSearchList = const [],
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
        periodicElements: compounds ?? this.periodicElements,
        errorMessage: errorMessage ?? this.errorMessage,
        elementSearchList: searched ?? this.elementSearchList,
        compoundSearched: compoundSearched ?? this.compoundSearched,
      );
}
