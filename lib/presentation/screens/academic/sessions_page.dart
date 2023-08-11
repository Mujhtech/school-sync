import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'widgets/create_session_form.dart';

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
        Consumer(
          child: SliverToBoxAdapter(
            child: Container(),
          ),
          builder: (BuildContext context, WidgetRef ref, Widget? child) => ref
              .watch(sessionsProvider)
              .when(
                data: (List<SessionViewModel> data) => data.isEmpty
                    ? SliverToBoxAdapter(
                        child: EmptyData(
                          action: () => AppDrawer(
                            content: const CreateSessionForm(),
                            title: 'Create session',
                            context: context,
                          ).show(),
                          label: 'Get started',
                        ),
                      )
                    : SliverPadding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: MediaQuery.paddingOf(context).bottom,
                        ),
                        sliver: SliverList.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            final int no = index + 1;
                            final SessionViewModel item = data[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '$no',
                                      style: context.textTheme.titleSmall,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      item.name,
                                      style: context.textTheme.titleSmall,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item.code ?? '',
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
                            );
                          },
                        ),
                      ),
                error: (Object error, StackTrace trace) =>
                    SliverToBoxAdapter(child: ErrorView(error, trace)),
                loading: () => child!,
              ),
        ),
      ],
    );
  }
}
