import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: context.screenWidth(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: AppBorderRadius.md,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarCustom(
                  showDomainLine: true,
                  showMeasureLine: true,
                  showDomainLabel: true,
                  showMeasureLabel: true,
                  spaceBetweenItem: 8,
                  listData: <DChartBarDataCustom>[
                    DChartBarDataCustom(
                      value: 13,
                      label: 'Jan',
                      color: Colors.black,
                    ),
                    DChartBarDataCustom(
                      value: 20,
                      label: 'Feb',
                      color: Colors.black.withOpacity(0.1),
                    ),
                    DChartBarDataCustom(
                      value: 30,
                      label: 'Mar',
                      color: Colors.black.withOpacity(0.1),
                    ),
                    DChartBarDataCustom(
                      value: 40,
                      label: 'Apr',
                      color: Colors.black.withOpacity(0.1),
                    ),
                    DChartBarDataCustom(
                      value: 25,
                      label: 'Mei',
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
