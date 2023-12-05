part of '../widgets.dart';

class SearchElementDelegate extends SearchDelegate {
  final CompoundsProvider compoundsProvider;
  Timer? debouncerTimer;

  SearchElementDelegate({
    required this.compoundsProvider,
  }) {
    this.compoundsProvider.setSearched(listPeriodic);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? Container()
          : IconButton(
              onPressed: () {
                query = '';
                this.compoundsProvider.setSearched(listPeriodic);
              },
              icon: Icon(Icons.clear),
            ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: context.pop,
      icon: Icon(Icons.chevron_left, color: Colors.black),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChanged(context, query);
    return Consumer<CompoundsProvider>(builder: (context, state, child) {
      final elements = state.compoundState.searched;
      return ElementListCards(
        elements: elements,
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(context, query);
    return Consumer<CompoundsProvider>(builder: (context, state, child) {
      final elements = state.compoundState.searched;
      return ElementListCards(
        elements: elements,
        onSelected: ((element) => {inspect(element)}),
      );
    });
  }

  void _onQueryChanged(BuildContext context, String query) {
    if (debouncerTimer?.isActive ?? false) debouncerTimer!.cancel();

    debouncerTimer = Timer(Duration(milliseconds: 250), () async {
      print(query);
      if (query.isEmpty) {
        return;
      }
      final result = searchElements(listPeriodic, query.trim());
      this.compoundsProvider.setSearched(result);
    });
  }
}
