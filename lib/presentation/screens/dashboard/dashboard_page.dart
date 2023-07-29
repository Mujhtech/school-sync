import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/presentation.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Navbar(),
          const Width10(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, _) {
                  return switch (ref.watch(navbarBodyProvider).current) {
                    NavbarMenuEnum.home => const HomePage(),
                    NavbarMenuEnum.academic => const HomePage(),
                    NavbarMenuEnum.students => const StudentPage(),
                    NavbarMenuEnum.grade => const GradeSystemPage(),
                    NavbarMenuEnum.staffs => const StaffPage(),
                    NavbarMenuEnum.payroll => const PayrollPage(),
                    _ => const NotFoundPage()
                  };
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
