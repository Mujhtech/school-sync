import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

import 'widget/addon.dart';
import 'widget/import_or_export.dart';
import 'widget/member.dart';
import 'widget/my_account.dart';
import 'widget/security.dart';
import 'widget/setting.dart';
import 'widget/upgrade.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SyncEnum syncing = SyncEnum.uploading;
  NavbarMenuEnum _menu = NavbarMenuEnum.setting;
  NavbarMenuEnum get menu => _menu;

  set menu(NavbarMenuEnum value) {
    _menu = value;
    setState(() {});
  }

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
            gradient: LinearGradient(
              stops: const <double>[0.015, 0.015],
              colors: <Color>[context.backgroundColor!, context.cardColor!],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppString.manage,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: context.textColor.withOpacity(0.5),
                          ),
                        ),
                        HyperLink(
                          onTap: () => context.router.goBack(),
                          child: CircleAvatar(
                            backgroundColor: context.backgroundColor,
                            radius: 10,
                            child: Icon(
                              TablerIcons.x,
                              size: 15,
                              color: context.iconColor!.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Height10(),
                  ...settingMenus
                      .map(
                        (NavbarMenu e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            NavLink(
                              nav: e,
                              currentMenu: menu,
                              onClicked: (NavbarMenuEnum? val) => menu = e.menu,
                            ),
                            const Height5(),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    switch (syncing) {
                      SyncEnum.uploading => TablerIcons.cloud_upload,
                      SyncEnum.downloading => TablerIcons.cloud_download,
                      SyncEnum.completed => TablerIcons.cloud_filled,
                      SyncEnum.connecting => TablerIcons.cloud_data_connection,
                      SyncEnum.connected => TablerIcons.cloud_computing
                    },
                    color: context.iconColor!.withOpacity(0.5),
                  ),
                  LinearProgressIndicator(
                    color: context.iconColor!.withOpacity(0.5),
                  ),
                  const Height3(),
                  Text(
                    '20 of 100',
                    style: context.textTheme.bodySmall!
                        .copyWith(color: context.textColor.withOpacity(0.5)),
                  )
                ],
              )
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
            child: switch (menu) {
              NavbarMenuEnum.setting => const SettingSection(),
              NavbarMenuEnum.account => const MyAccount(),
              NavbarMenuEnum.security => const SecuritySection(),
              NavbarMenuEnum.member => const MemberSection(),
              NavbarMenuEnum.addon => const AddonSection(),
              NavbarMenuEnum.upgrade => const UpgradeSeciton(),
              NavbarMenuEnum.import_and_export => const ImportOrExportSection(),
              _ => const NotFoundPage(),
            },
          ),
        )
      ],
    );
  }
}
