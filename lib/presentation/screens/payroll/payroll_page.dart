import 'package:flutter/material.dart';

import 'package:school_sync/presentation.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'widgets/payroll_report.dart';
import 'widgets/run_payroll.dart';

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 5),
          sliver: SliverList.list(
            children: const <Widget>[PayrollReport(), Height10(), RunPayroll()],
          ),
        ),
        const SliverToBoxAdapter(
          child: Height10(),
        ),
        SliverPinnedHeader(
          child: Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 5,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '32 Payroll',
                      style: context.textTheme.titleLarge,
                    ),
                    Row(
                      children: <Widget>[
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
                                'Add Staff',
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
                const Height10(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '#',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Status',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Staff',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Total payment',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Pay date',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Approve date',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Height10(),
        ),
        SliverList.separated(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${index + 1}',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Status',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Staff',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Total payment',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Pay date',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Approve date',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) =>
                const Height15())
      ],
    );
  }
}
