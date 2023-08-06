import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: CustomSliverAppBarWithHeader(
            title: AppString.sessions,
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
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
