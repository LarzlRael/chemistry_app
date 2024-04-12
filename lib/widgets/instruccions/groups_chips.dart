part of '../widgets.dart';

class GroupsChips extends StatelessWidget {
  const GroupsChips({super.key, required this.groups});
  final List<Group> groups;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: groups
          .map(
            (group) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.5, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorByGroup(group),
                ),
                child: SimpleText(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  group.name.toUpperCase(),
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
                /* backgroundColor: colorByGroup(group), */
              ),
            ),
          )
          .toList(),
    );
  }
}
