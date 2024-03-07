part of '../widgets.dart';

class SearchElementDelegate extends SearchDelegate {
  /* final CompoundNotifier compoundsNotifier;
  final CompoundState compoundsState; */
  final CompoundNotifier compoundsProvider;

  Timer? debouncerTimer;

  SearchElementDelegate({
    /* required this.compoundsNotifier,
    required this.compoundsState, */
    required this.compoundsProvider,
  }) {
    /* this.compoundsNotifier.setSearched(listPeriodic); */
    this.compoundsProvider.setSearched(allListPeriodic);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? Container()
          : IconButton(
              onPressed: () {
                query = '';
                this.compoundsProvider.setSearched(allListPeriodic);
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
    return ResultAndSuggestion();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /*   if (query.isEmpty) {
      return Container();
    } */
    _onQueryChanged(context, query);
    return ResultAndSuggestion();
  }

  void _onQueryChanged(BuildContext context, String query) {
    if (debouncerTimer?.isActive ?? false) debouncerTimer!.cancel();

    debouncerTimer = Timer(Duration(milliseconds: 250), () async {
      print(query);
      if (query.isEmpty) {
        this.compoundsProvider.setSearched(allListPeriodic);
      }
      final result = searchElements(allListPeriodic, query.trim());
      this.compoundsProvider.setSearched(result);
    });
  }
}

class ResultAndSuggestion extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final compoundsS = ref.watch(compoundProvider).elementSearchList;
    return ElementsListTile(
        elements: compoundsS,
        onSelected: (element) =>
            context.push(ElementsDetail.routeName, extra: element));
  }
}
