// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

enum NavbarMenuEnum {
  students,
  staffs,
  academic,
  payroll,
  home,
  grade,
  setting,
  language,
  import_and_export,
  addon,
  trash,
  member,
  security,
  upgrade,
  account,
  classes,
  subject,
  session,
  inflow_and_expense
}

class NavbarMenu {
  NavbarMenu({
    required this.label,
    required this.icon,
    required this.menu,
    this.subMenu,
  });
  String label;
  IconData icon;

  NavbarMenuEnum menu;

  List<NavbarMenu>? subMenu;
}

List<NavbarMenu> navbarMenuList = <NavbarMenu>[
  NavbarMenu(
    icon: TablerIcons.home_2,
    label: AppString.dashboard,
    menu: NavbarMenuEnum.home,
  ),
  NavbarMenu(
    icon: TablerIcons.school,
    label: AppString.academic,
    menu: NavbarMenuEnum.academic,
    subMenu: <NavbarMenu>[
      NavbarMenu(
        icon: TablerIcons.arrow_narrow_right,
        label: AppString.classes,
        menu: NavbarMenuEnum.classes,
      ),
      NavbarMenu(
        icon: TablerIcons.arrow_narrow_right,
        label: AppString.subjects,
        menu: NavbarMenuEnum.subject,
      ),
      NavbarMenu(
        icon: TablerIcons.arrow_narrow_right,
        label: AppString.sessions,
        menu: NavbarMenuEnum.session,
      ),
    ],
  ),
  NavbarMenu(
    icon: TablerIcons.users,
    label: AppString.students,
    menu: NavbarMenuEnum.students,
  ),
  NavbarMenu(
    icon: TablerIcons.report_analytics,
    label: AppString.gradeSystem,
    menu: NavbarMenuEnum.grade,
  ),
  NavbarMenu(
    icon: TablerIcons.users,
    label: AppString.staffs,
    menu: NavbarMenuEnum.staffs,
  ),
  NavbarMenu(
    icon: TablerIcons.wallet,
    label: AppString.payroll,
    menu: NavbarMenuEnum.payroll,
  ),
  NavbarMenu(
    icon: TablerIcons.arrows_up_down,
    label: AppString.inflowAndExpense,
    menu: NavbarMenuEnum.inflow_and_expense,
  ),
  NavbarMenu(
    icon: TablerIcons.settings,
    label: AppString.setting,
    menu: NavbarMenuEnum.setting,
  ),
  NavbarMenu(
    icon: TablerIcons.trash,
    label: AppString.trash,
    menu: NavbarMenuEnum.trash,
  ),
];

List<NavbarMenu> settingMenus = <NavbarMenu>[
  NavbarMenu(
    label: AppString.myAccount,
    icon: TablerIcons.user_circle,
    menu: NavbarMenuEnum.account,
  ),
  NavbarMenu(
    label: AppString.language,
    icon: TablerIcons.language,
    menu: NavbarMenuEnum.language,
  ),
  NavbarMenu(
    label: AppString.member,
    icon: TablerIcons.user_x,
    menu: NavbarMenuEnum.member,
  ),
  NavbarMenu(
    label: AppString.settings,
    icon: TablerIcons.settings,
    menu: NavbarMenuEnum.setting,
  ),
  NavbarMenu(
    label: AppString.addon,
    icon: TablerIcons.package,
    menu: NavbarMenuEnum.addon,
  ),
  NavbarMenu(
    label: AppString.upgrade,
    icon: TablerIcons.square_arrow_up,
    menu: NavbarMenuEnum.upgrade,
  ),
  NavbarMenu(
    label: AppString.security,
    icon: TablerIcons.key,
    menu: NavbarMenuEnum.security,
  ),
  NavbarMenu(
    label: AppString.importOrExport,
    icon: TablerIcons.database,
    menu: NavbarMenuEnum.import_and_export,
  ),
];
