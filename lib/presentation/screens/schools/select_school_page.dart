import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'widgets/add_new_school_card.dart';
import 'widgets/select_school_card.dart';

class SelectSchoolPage extends StatefulWidget {
  const SelectSchoolPage({super.key});

  @override
  State<SelectSchoolPage> createState() => _SelectSchoolPageState();
}

class _SelectSchoolPageState extends State<SelectSchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) => ref
            .watch(schoolsProvider)
            .when(
              data: (List<SchoolViewModel> data) => Center(
                child: SizedBox(
                  width: context.screenWidth(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          AppString.mySchools,
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      const Height20(),
                      if (data.isNotEmpty)
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (_, int index) {
                              if (index == 0) {
                                return const Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: AddNewSchoolCard(),
                                );
                              }

                              final SchoolViewModel item = data[index - 1];

                              final SelectSchoolCard child = SelectSchoolCard(
                                onClicked: () {
                                  ref
                                      .read(
                                        currentSelectedSchoolProvider.notifier,
                                      )
                                      .changeCurrentSchool(item.id)
                                      .then((bool value) {
                                    if (value) {
                                      context.router.goToDashboard();
                                    }
                                  });
                                },
                                school: item,
                              );

                              if ((index - 1) == data.length - 1) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: child,
                                );
                              }
                              return child;
                            },
                            separatorBuilder: (_, int index) {
                              return const Width15();
                            },
                            itemCount: data.length + 1,
                          ),
                        )
                      else
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${AppString.nothingToSeeHere}, Let's create your first school",
                                style: context.textTheme.bodySmall,
                              ),
                              const Height15(),
                              PrimaryButton(
                                width: 100,
                                height: 35,
                                label: "Let's go",
                                icon: Icon(
                                  TablerIcons.plus,
                                  color: context.buttonTextColor,
                                  size: 16,
                                ),
                                iconPosition: IconPosition.left,
                                onPressed: () {
                                  context.router.goToCreateSchool();
                                },
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
              error: ErrorView.new,
              loading: () => child!,
            ),
        child: Container(),
      ),
    );
  }
}
