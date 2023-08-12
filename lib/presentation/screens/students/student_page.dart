import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/students/widgets/student_graph.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tabler_icons/tabler_icons.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 5),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StudentGraph(),
                    Width10(),
                    StudentGraph(),
                    Width10(),
                    StudentGraph(),
                  ],
                ),
                const Height15(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppString.students,
                      style: context.textTheme.titleSmall,
                    ),
                    HyperLink(
                      child: Icon(
                        TablerIcons.circle_plus,
                        size: 18,
                        color: context.iconColor,
                      ),
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SliverPinnedHeader(
          child: Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 5,
              bottom: 10,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '#',
                    style: context.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    AppString.name,
                    style: context.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    AppString.classe,
                    style: context.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    AppString.unit,
                    style: context.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    AppString.action,
                    style: context.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
