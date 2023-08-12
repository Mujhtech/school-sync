import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

import 'widgets/inflow_and_expense_report.dart';

class InfowAndExpensePage extends StatelessWidget {
  const InfowAndExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 5),
          sliver: SliverList.list(
            children: const <Widget>[InflowAndExpenseReport(), Height10()],
          ),
        ),
        const SliverToBoxAdapter(
          child: Height10(),
        ),
      ],
    );
  }
}
