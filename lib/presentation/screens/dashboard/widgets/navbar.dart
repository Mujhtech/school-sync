import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/schools/widgets/schools_dialog.dart';
import 'package:school_sync/presentation/screens/setting/setting_page.dart';
import 'package:school_sync/presentation/screens/trash/trash_page.dart';
import 'package:school_sync/presentation/states/user_provider.dart';

import 'package:tabler_icons/tabler_icons.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: Container(
        width: context.navbarWidth,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, _) {
                    return ref.watch(currentSelectedSchoolProvider).when(
                          data:
                              (CurrentSelectedSchoolState currentSchoolState) =>
                                  Padding(
                            padding: const EdgeInsets.only(left: 5, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  TablerIcons.school,
                                  size: 15,
                                  color: context.iconColor,
                                ),
                                const Width3(),
                                Expanded(
                                  child: Text(
                                    currentSchoolState.school?.name ??
                                        AppString.appName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: context.textTheme.titleSmall,
                                  ),
                                ),
                                const Width10(),
                                HyperLink(
                                  onTap: () {
                                    AppDialog(
                                      context: context,
                                      bgColor: Colors.transparent,
                                      width: context.screenWidth(0.5),
                                      content: const SearchPage(),
                                    ).show();
                                  },
                                  child: Icon(
                                    TablerIcons.search,
                                    size: 15,
                                    color: context.iconColor!.withOpacity(0.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          error: (Object err, StackTrace stackTrace) => Text(
                            err.toString(),
                            style: context.textTheme.bodySmall,
                          ),
                          loading: () => Row(
                            children: <Widget>[
                              const CustomShimmer.rectangular(
                                height: 20,
                                width: 20,
                                shapeBorder: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(99)),
                                ),
                              ),
                              Expanded(
                                child: CustomShimmer.rectangular(
                                  height: 20,
                                  width: context.screenWidth(),
                                  shapeBorder: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                  },
                ),
                const Height10(),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, _) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        final NavbarMenu item = navbarMenuList.sublist(
                          0,
                          navbarMenuList.length - 2,
                        )[index];
                        return NavLink(
                          key: Key('nav_menu-$index'),
                          nav: item,
                          currentMenu: ref.watch(navbarBodyProvider).current,
                          onClicked: (NavbarMenuEnum? val) {
                            ref
                                .read(navbarBodyProvider.notifier)
                                .switchNav(val ?? item.menu);
                          },
                        );
                      },
                      separatorBuilder: (_, int index) => const Height5(),
                      itemCount: navbarMenuList
                          .sublist(0, navbarMenuList.length - 2)
                          .length,
                    );
                  },
                ),
                const Height20(),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    AppString.quickLink,
                    style: context.textTheme.titleSmall!
                        .copyWith(color: context.textColor.withOpacity(0.5)),
                  ),
                ),
                const Height10(),
                NavLink(
                  nav: navbarMenuList[navbarMenuList.length - 2],
                  onClicked: (NavbarMenuEnum? val) {
                    AppDialog(
                      context: context,
                      bgColor: Colors.transparent,
                      width: context.screenWidth(0.8),
                      content: const SettingPage(),
                    ).show();
                  },
                ),
                const Height5(),
                NavLink(
                  nav: navbarMenuList[navbarMenuList.length - 1],
                  onClicked: (NavbarMenuEnum? val) {
                    AppDialog(
                      context: context,
                      bgColor: Colors.transparent,
                      width: context.screenWidth(0.28),
                      content: const TrashPage(),
                    ).show();
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, _) {
                      return ref.watch(userProvider).when(
                            data: (UserEntity? user) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      '${user?.firstName.firstLetter}',
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Width5(),
                                  Text(
                                    '${user?.firstName} ${user?.lastName}',
                                    style: context.textTheme.titleSmall,
                                  )
                                ],
                              ),
                            ),
                            error: (Object err, StackTrace stackTrace) => Text(
                              err.toString(),
                              style: context.textTheme.bodySmall,
                            ),
                            loading: () => Row(
                              children: <Widget>[
                                const CustomShimmer.rectangular(
                                  height: 20,
                                  width: 20,
                                  shapeBorder: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(99)),
                                  ),
                                ),
                                Expanded(
                                  child: CustomShimmer.rectangular(
                                    height: 20,
                                    width: context.screenWidth(),
                                    shapeBorder: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                    },
                  ),
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, _) {
                      return ref.watch(currentSelectedSchoolProvider).when(
                            data: (
                              CurrentSelectedSchoolState currentSchoolState,
                            ) =>
                                HyperLink(
                              onTap: () {
                                AppDialog(
                                  context: context,
                                  bgColor: context.backgroundColor,
                                  width: context.screenWidth(0.23),
                                  content: const SchoolsDialog(),
                                ).show();
                              },
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: context.backgroundColor,
                                    child: currentSchoolState.school != null
                                        ? Text(
                                            currentSchoolState.school!.acronyms
                                                    ?.firstLetter ??
                                                '',
                                            style: context.textTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        : Icon(
                                            TablerIcons.plus,
                                            size: 30,
                                            color: context.iconColor,
                                          ),
                                  ),
                                  Icon(
                                    TablerIcons.arrows_move_vertical,
                                    size: 20,
                                    color: context.iconColor!.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                            error: (Object err, StackTrace stackTrace) => Text(
                              err.toString(),
                              style: context.textTheme.bodySmall,
                            ),
                            loading: () => const CustomShimmer.rectangular(
                              height: 20,
                              width: 20,
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(99)),
                              ),
                            ),
                          );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
