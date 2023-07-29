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
  trash
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
