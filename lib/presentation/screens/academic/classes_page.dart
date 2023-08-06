import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  bool _isHeaderSticky = false;
  bool get isHeaderSticky => _isHeaderSticky;
  set isHeaderSticky(bool value) {
    setState(() {
      _isHeaderSticky = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: CustomSliverAppBarWithHeader(
            title: AppString.classes,
            isSticky: _isHeaderSticky,
            onSticky: (bool sticky) => isHeaderSticky = sticky,
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
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
                        AppString.code,
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
                const Divider(
                  thickness: 0.1,
                )
              ],
            ),
          ),
          pinned: true,
        ),
        SliverList.builder(
          itemCount: 100,
          itemBuilder: (BuildContext ctx, int index) => Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _isHeaderSticky ? 40 : 20),
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
                    AppString.code,
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
