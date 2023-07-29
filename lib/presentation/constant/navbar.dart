// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
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
  account
}

class NavbarMenu {
  NavbarMenu({required this.label, required this.icon, required this.menu});
  String label;
  IconData icon;

  NavbarMenuEnum menu;
}

List<NavbarMenu> navbarMenuList = <NavbarMenu>[
  NavbarMenu(
    icon: TablerIcons.home_2,
    label: 'Dashboard',
    menu: NavbarMenuEnum.home,
  ),
  NavbarMenu(
    icon: TablerIcons.user,
    label: 'Academic',
    menu: NavbarMenuEnum.academic,
  ),
  NavbarMenu(
    icon: TablerIcons.users,
    label: 'Students',
    menu: NavbarMenuEnum.students,
  ),
  NavbarMenu(
    icon: TablerIcons.report_analytics,
    label: 'Grade System',
    menu: NavbarMenuEnum.grade,
  ),
  NavbarMenu(
    icon: TablerIcons.user,
    label: 'Staffs',
    menu: NavbarMenuEnum.staffs,
  ),
  NavbarMenu(
    icon: TablerIcons.wallet,
    label: 'Payroll',
    menu: NavbarMenuEnum.payroll,
  ),
  NavbarMenu(
    icon: TablerIcons.settings,
    label: 'Setting',
    menu: NavbarMenuEnum.setting,
  ),
  NavbarMenu(
    icon: TablerIcons.trash,
    label: 'Trash',
    menu: NavbarMenuEnum.trash,
  ),
];

List<NavbarMenu> settingMenus = <NavbarMenu>[
  NavbarMenu(
    label: 'My Account',
    icon: TablerIcons.user_circle,
    menu: NavbarMenuEnum.grade,
  ),
  NavbarMenu(
    label: 'Language',
    icon: TablerIcons.language,
    menu: NavbarMenuEnum.language,
  ),
  NavbarMenu(
    label: 'Member',
    icon: TablerIcons.user_x,
    menu: NavbarMenuEnum.member,
  ),
  NavbarMenu(
    label: 'Settings',
    icon: TablerIcons.settings,
    menu: NavbarMenuEnum.setting,
  ),
  NavbarMenu(
    label: 'Add-on',
    icon: TablerIcons.package,
    menu: NavbarMenuEnum.addon,
  ),
  NavbarMenu(
    label: 'Upgrade',
    icon: TablerIcons.square_arrow_up,
    menu: NavbarMenuEnum.upgrade,
  ),
  NavbarMenu(
    label: 'Security',
    icon: TablerIcons.key,
    menu: NavbarMenuEnum.security,
  ),
  NavbarMenu(
    label: 'Import/Export',
    icon: TablerIcons.database,
    menu: NavbarMenuEnum.import_and_export,
  ),
];
