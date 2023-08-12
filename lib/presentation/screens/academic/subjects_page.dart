import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'widgets/create_subject_form.dart';

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
            actions: <Widget>[
              HyperLink(
                child: Icon(
                  TablerIcons.circle_plus,
                  size: 18,
                  color: context.iconColor,
                ),
                onTap: () => AppDrawer(
                  content: const CreateSubjectForm(),
                  title: AppString.createSubject,
                  context: context,
                ).show(),
              )
            ],
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
                        AppString.title,
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
                const Height5(),
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
              .watch(subjectsProvider)
              .when(
                data: (List<SubjectViewModel> data) => data.isEmpty
                    ? SliverToBoxAdapter(
                        child: EmptyData(
                          action: () => AppDrawer(
                            content: const CreateSubjectForm(),
                            title: AppString.createSubject,
                            context: context,
                          ).show(),
                          label: AppString.getStarted,
                        ),
                      )
                    : SliverPadding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: MediaQuery.paddingOf(context).bottom,
                        ),
                        sliver: SliverList.separated(
                          itemCount: data.length,
                          separatorBuilder: (BuildContext ctx, int index) =>
                              const Height15(),
                          itemBuilder: (BuildContext ctx, int index) {
                            final int no = index + 1;
                            final SubjectViewModel item = data[index];
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
                                      '${item.unit}',
                                      style: context.textTheme.titleSmall,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: HyperLink(
                                        onTap: () {},
                                        child: Icon(
                                          TablerIcons.dots_circle_horizontal,
                                          size: 18,
                                          color: context.iconColor,
                                        ),
                                      ),
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
