part of 'providers.dart';

final globalProvider = StateNotifierProvider<GlobalNotifier, CompoundState>(
    (ref) => GlobalNotifier());

class GlobalNotifier extends StateNotifier<CompoundState> {
  GlobalNotifier() : super(CompoundState.initial());

  showSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: SimpleText(
          message,
          color: Colors.white,
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class GlobalState {
  final bool isLoading;
  final List<PeriodicTableElement> periodicElements;
  final List<PeriodicTableElement> elementSearchList;
  final List<Compound> compoundSearched;
  final String errorMessage;

  GlobalState({
    this.isLoading = true,
    this.periodicElements = const [],
    this.errorMessage = '',
    this.elementSearchList = const [],
    this.compoundSearched = const [],
  });
  factory GlobalState.initial() => GlobalState();

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
