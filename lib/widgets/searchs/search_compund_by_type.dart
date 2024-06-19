part of '../widgets.dart';

class SearchCompoundByType extends SearchDelegate {
  final List<Compound> listCompounds;
  final CompoundNotifier compoundNotifier;
  @override
  String get searchFieldLabel => 'Buscar compuesto';
  Timer? debouncerTimer;

  SearchCompoundByType({
    required this.listCompounds,
    required this.compoundNotifier,
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
      icon: Icon(Icons.chevron_left, size: 30),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChanged(context, query);
    return CompoundsResultAndSuggestion();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /*   if (query.isEmpty) {
      return Container();
    } */
    _onQueryChanged(context, query);
    return CompoundsResultAndSuggestion();
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

class CompoundsResultAndSuggestion extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final compoundsS = ref.watch(compoundProvider).compoundSearched;
    return CompoundListSimple(
      compounds: compoundsS,
      onSelected: (Compound element) {
        context.push(
          CompoundDetailPage.routeName,
          extra: element,
        );
      },
    );
  }
}
