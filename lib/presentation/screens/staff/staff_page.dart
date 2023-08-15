import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'widgets/staff_enrollment_banner.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 5),
          sliver: SliverList.list(
            children: <Widget>[
              const StaffEnrollmentBanner(),
              const Height15(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    AppString.staffs,
                    style: context.textTheme.titleSmall,
                  ),
                  HyperLink(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          TablerIcons.circle_plus,
                          size: 18,
                          color: context.iconColor,
                        ),
                        const Width3(),
                        Text(
                          'Add staff',
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  )
                ],
              )
            ],
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
                    AppString.admissionNo,
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
