import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'widgets/create_class_form.dart';

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
        Consumer(
          child: SliverToBoxAdapter(
            child: Container(),
          ),
          builder: (BuildContext context, WidgetRef ref, Widget? child) => ref
              .watch(classesProvider)
              .when(
                data: (List<ClassViewModel> data) => data.isEmpty
                    ? SliverToBoxAdapter(
                        child: EmptyData(
                          action: () => AppDrawer(
                            content: const CreateClassForm(),
                            title: 'Create class',
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
                            final ClassViewModel item = data[index];

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
