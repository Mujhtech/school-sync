import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

enum NavbarMenuEnum { students, staffs, payroll, home, grade, setting }

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
    icon: TablerIcons.wallet,
    label: 'Payroll',
    menu: NavbarMenuEnum.payroll,
  ),
  NavbarMenu(
    icon: TablerIcons.user,
    label: 'Staffs',
    menu: NavbarMenuEnum.staffs,
  ),
  NavbarMenu(
    icon: TablerIcons.settings,
    label: 'Setting',
    menu: NavbarMenuEnum.setting,
  ),
];
