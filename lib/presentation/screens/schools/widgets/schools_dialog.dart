import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class SchoolsDialog extends StatefulWidget {
  const SchoolsDialog({super.key});

  @override
  State<SchoolsDialog> createState() => _SchoolsDialogState();
}

class _SchoolsDialogState extends State<SchoolsDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PrimaryTextFormField(
          hint: 'Search',
          prefixIcon: Icon(
            TablerIcons.search,
            size: 15,
            color: context.iconColor,
          ),
          contentPadding: const EdgeInsets.all(5),
          onChanged: (String value) {},
        ),
        const Height10(),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              ref.watch(schoolsProvider).when(
                    data: (List<SchoolViewModel> data) => SizedBox(
                      width: context.screenWidth(),
                      child: data.isNotEmpty
                          ? SizedBox(
                              height: 200,
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (_, int index) {
                                  final SchoolViewModel item = data[index];

                                  return GestureDetector(
                                    onTap: () {},
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            item.name,
                                            style: context.textTheme.titleSmall,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, int index) {
                                  return const Height10();
                                },
                                itemCount: data.length,
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Nothing to see here, Let's create your first school",
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
                            ),
                    ),
                    error: ErrorView.new,
                    loading: () => child!,
                  ),
          child: Container(),
        ),
        const Divider(
          thickness: 0.5,
        ),
        PrimaryButton(
          onPressed: () {},
          height: 30,
          buttonColor: Colors.transparent,
          textColor: context.textColor,
          label: 'Add new school',
          iconPosition: IconPosition.left,
          icon: Icon(
            TablerIcons.plus,
            size: 15,
            color: context.iconColor,
          ),
        ),
        const Height5(),
        Center(
          child: HyperLink(
            onTap: () => context.router.goBack(),
            child: Text(
              'Close',
              style: context.textTheme.bodySmall,
            ),
          ),
        )
      ],
    );
  }
}
