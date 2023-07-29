import 'package:flutter/widgets.dart';
import 'package:school_sync/presentation.dart';

import 'package:tabler_icons/tabler_icons.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: context.screenWidth(0.15),
          height: context.screenHeight(0.85),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Manage',
                    style: context.textTheme.titleSmall!
                        .copyWith(color: context.textColor.withOpacity(0.5)),
                  ),
                  HyperLink(
                    onTap: () => context.router.goBack(),
                    child: Icon(
                      TablerIcons.x,
                      size: 15,
                      color: context.iconColor!.withOpacity(0.5),
                    ),
                  )
                ],
              ),
              const Height10(),
              NavLink(
                nav: NavbarMenu(
                  label: 'My Account',
                  icon: TablerIcons.user_circle,
                  menu: NavbarMenuEnum.grade,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Settings',
                  icon: TablerIcons.settings,
                  menu: NavbarMenuEnum.grade,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Language',
                  icon: TablerIcons.language,
                  menu: NavbarMenuEnum.language,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Add-on',
                  icon: TablerIcons.package,
                  menu: NavbarMenuEnum.addon,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Upgrade',
                  icon: TablerIcons.square_arrow_up,
                  menu: NavbarMenuEnum.grade,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Import/Export',
                  icon: TablerIcons.database,
                  menu: NavbarMenuEnum.import_and_export,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Security',
                  icon: TablerIcons.key,
                  menu: NavbarMenuEnum.import_and_export,
                ),
                onClicked: () {},
              ),
              const Height5(),
              NavLink(
                nav: NavbarMenu(
                  label: 'Member',
                  icon: TablerIcons.user_x,
                  menu: NavbarMenuEnum.import_and_export,
                ),
                onClicked: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: context.screenHeight(0.85),
            decoration: BoxDecoration(
              color: context.backgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
        )
      ],
    );
  }
}
