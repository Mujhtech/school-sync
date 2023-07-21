import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/schools/widgets/add_new_school_card.dart';

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
      body: Center(
        child: SizedBox(
          width: context.screenWidth(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  AppString.mySchools,
                  style: context.textTheme.titleLarge,
                ),
              ),
              const Height20(),
              SizedBox(
                height: 200,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
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

                      if (index == 20 - 1) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: SelectSchoolCard(),
                        );
                      }
                      return const SelectSchoolCard();
                    },
                    separatorBuilder: (_, int index) {
                      return const Width15();
                    },
                    itemCount: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
