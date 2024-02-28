part of '../widgets.dart';

class SearchElementDelegate extends SearchDelegate {
  final CompoundNotifier compoundsNotifier;
  final CompoundState compoundsState;
  Timer? debouncerTimer;

  SearchElementDelegate({
    required this.compoundsNotifier,
    required this.compoundsState,
  }) {
    this.compoundsNotifier.setSearched(listPeriodic);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? Container()
          : IconButton(
              onPressed: () {
                query = '';
                this.compoundsNotifier.setSearched(listPeriodic);
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
    return ElementsListTile(
      elements: compoundsState.searched,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /*   if (query.isEmpty) {
      return Container();
    } */
    _onQueryChanged(context, query);
    return ElementsListTile(
      elements: compoundsState.searched,
      onSelected: ((element) => {inspect(element)}),
    );
  }

  void _onQueryChanged(BuildContext context, String query) {
    if (debouncerTimer?.isActive ?? false) debouncerTimer!.cancel();

    debouncerTimer = Timer(Duration(milliseconds: 250), () async {
      print(query);
      if (query.isEmpty) {
        return;
      }
      final result = searchElements(listPeriodic, query.trim());
      this.compoundsNotifier.setSearched(result);
    });
  }
}
