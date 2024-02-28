part of '../widgets.dart';

class SearchCompundByType extends SearchDelegate {
  final List<Compound> listCompounds;
  final CompoundNotifier compoundNotifier;
  final CompoundState compoundState;
  Timer? debouncerTimer;

  SearchCompundByType({
    required this.listCompounds,
    required this.compoundNotifier,
    required this.compoundState,
  }) {
    this.compoundNotifier.setCompoundSearched(listCompounds);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? Container()
          : IconButton(
              onPressed: () {
                query = '';
                this.compoundNotifier.setCompoundSearched(listCompounds);
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
    return CompundListTile(
      compounds: compoundState.compoundSearched,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /*   if (query.isEmpty) {
      return Container();
    } */
    _onQueryChanged(context, query);
    return CompundListTile(
      compounds: compoundState.compoundSearched,
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
      final result = searchCompound(listCompounds, query.trim());
      this.compoundNotifier.setCompoundSearched(result);
    });
  }
}
