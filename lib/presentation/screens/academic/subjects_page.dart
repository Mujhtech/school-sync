import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: CustomSliverAppBarWithHeader(
            title: AppString.subjects,
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
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              ref.watch(subjectsProvider).when(
                    data: (List<SubjectViewModel> data) => SliverList.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        final int no = index + 1;
                        final SubjectViewModel item = data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                                  item.title,
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
                    error: (Object error, StackTrace trace) =>
                        SliverToBoxAdapter(child: ErrorView(error, trace)),
                    loading: () => child!,
                  ),
        ),
      ],
    );
  }
}
