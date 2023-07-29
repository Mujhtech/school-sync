import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/screens/schools/widgets/schools_dialog.dart';
import 'package:school_sync/presentation/screens/setting/setting_page.dart';
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
    return Container(
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
                        data: (CurrentSelectedSchoolState currentSchoolState) =>
                            Padding(
                          padding: const EdgeInsets.only(left: 5, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                TablerIcons.photo_off,
                                size: 15,
                                color: context.iconColor,
                              ),
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
                              Icon(
                                TablerIcons.search,
                                size: 15,
                                color: context.iconColor!.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                        error: (Object err, StackTrace stackTrace) => Text(
                          err.toString(),
                          style: context.textTheme.bodySmall,
                        ),
                        // TODO(Mujhtech): Showing skeleton widget
                        loading: () => const SizedBox.shrink(),
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
                        isActive:
                            ref.watch(navbarBodyProvider).current == item.menu,
                        onClicked: () {
                          ref
                              .read(navbarBodyProvider.notifier)
                              .switchNav(item.menu);
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
                  'Quick link',
                  style: context.textTheme.titleSmall!
                      .copyWith(color: context.textColor.withOpacity(0.5)),
                ),
              ),
              const Height10(),
              NavLink(
                nav: navbarMenuList[navbarMenuList.length - 2],
                onClicked: () {
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
                onClicked: () {
                  AppDialog(
                    context: context,
                    bgColor: Colors.transparent,
                    width: context.screenWidth(0.8),
                    content: const SettingPage(),
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
                                    style: context.textTheme.bodySmall!
                                        .copyWith(fontWeight: FontWeight.w700),
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
                          // TODO(Mujhtech): Showing skeleton widget
                          loading: () => const SizedBox.shrink(),
                        );
                  },
                ),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, _) {
                    return ref.watch(currentSelectedSchoolProvider).when(
                          data:
                              (CurrentSelectedSchoolState currentSchoolState) =>
                                  GestureDetector(
                            onTap: () {
                              AppDialog(
                                context: context,
                                bgColor: context.backgroundColor,
                                width: context.screenWidth(0.23),
                                content: const SchoolsDialog(),
                              ).show();
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
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
                                  const Width5(),
                                  Column(
                                    children: <Widget>[
                                      Icon(
                                        TablerIcons.chevron_up,
                                        size: 16,
                                        color:
                                            context.iconColor!.withOpacity(0.5),
                                      ),
                                      Icon(
                                        TablerIcons.chevron_down,
                                        size: 16,
                                        color:
                                            context.iconColor!.withOpacity(0.5),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          error: (Object err, StackTrace stackTrace) => Text(
                            err.toString(),
                            style: context.textTheme.bodySmall,
                          ),
                          // TODO(Mujhtech): Showing skeleton widget
                          loading: () => const SizedBox.shrink(),
                        );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavLink extends StatefulWidget {
  const NavLink({
    super.key,
    required this.nav,
    required this.onClicked,
    this.isActive = false,
  });
  final NavbarMenu nav;
  final VoidCallback onClicked;
  final bool isActive;

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClicked.call(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        // onHover: (PointerHoverEvent event) {
        //   isHover = !isHover;
        //   setState(() {});
        // },
        onEnter: (PointerEnterEvent event) {
          isHover = !isHover;
          setState(() {});
        },
        onExit: (PointerExitEvent event) {
          isHover = !isHover;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isHover || widget.isActive
                ? context.theme.iconTheme.color!.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                widget.nav.icon,
                size: 18,
                color: context.theme.iconTheme.color!
                    .withOpacity(isHover || widget.isActive ? 1 : 0.5),
              ),
              const Width5(),
              Text(
                widget.nav.label,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.theme.iconTheme.color!
                      .withOpacity(isHover || widget.isActive ? 1 : 0.5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
