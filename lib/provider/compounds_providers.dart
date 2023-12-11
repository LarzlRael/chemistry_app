part of 'providers.dart';

final compoundProvider =
    StateNotifierProvider<CompoundNotifier, CompoundStateProvider>(
        (ref) => CompoundNotifier());

class CompoundNotifier extends StateNotifier<CompoundStateProvider> {
  CompoundNotifier() : super(CompoundStateProvider.initial());

  void setSearched(List<PeriodicTableElement> listPeriodic) {
    state = state.copyWith(searched: listPeriodic);
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

class CompoundStateProvider {
  final bool isLoading;
  final List<PeriodicTableElement> compounds;
  final List<PeriodicTableElement> searched;
  final String errorMessage;

  CompoundStateProvider({
    this.isLoading = true,
    this.compounds = const [],
    this.errorMessage = '',
    this.searched = const [],
  });
  factory CompoundStateProvider.initial() => CompoundStateProvider();

  CompoundStateProvider copyWith({
    bool? isLoading,
    List<PeriodicTableElement>? compounds,
    String? errorMessage,
    List<PeriodicTableElement>? searched,
  }) =>
      CompoundStateProvider(
        isLoading: isLoading ?? this.isLoading,
        compounds: compounds ?? this.compounds,
        errorMessage: errorMessage ?? this.errorMessage,
        searched: searched ?? this.searched,
      );
}
