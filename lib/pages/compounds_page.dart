part of 'pages.dart';

class CompoundsPage extends StatelessWidget {
  const CompoundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final element = listPeriodic.first;
    return Scaffold(
      body: ListTile(
        title: Text(element.name),
        subtitle: Text(element.group.toString()),
        leading: Text(element.symbol),
        trailing: Text(element.value!),
        onTap: () {
          /* context.goNamed(CompoundsPage.routeName); */
        },
      ),
    );
  }
}
