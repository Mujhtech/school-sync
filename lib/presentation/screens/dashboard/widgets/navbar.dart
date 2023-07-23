import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_sync/domain.dart';
import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/states/user_provider.dart';
import 'package:tabler_icons/tabler_icons.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppString.appName,
                      style: context.textTheme.titleSmall,
                    ),
                    Icon(
                      TablerIcons.search,
                      size: 15,
                      color: context.iconColor!.withOpacity(0.5),
                    )
                  ],
                ),
              ),
              const Height10(),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return NavLink(
                    key: Key('nav_menu-$index'),
                    nav: navbarMenuList[index],
                  );
                },
                separatorBuilder: (_, int index) => const Height10(),
                itemCount: navbarMenuList.length,
              ),
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
                          data: (UserEntity? user) => Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                                child: Text(
                                  '${user?.firstName.split('')[0]}',
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
                          error: (Object err, StackTrace stackTrace) => Text(
                            err.toString(),
                            style: context.textTheme.bodySmall,
                          ),
                          // TODO(Mujhtech): Showing skeleton widget
                          loading: () => const SizedBox.shrink(),
                        );
                  },
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.yellow,
                      child: Text(
                        'M',
                        style: context.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Width5(),
                    Column(
                      children: <Widget>[
                        Icon(
                          TablerIcons.chevron_up,
                          size: 16,
                          color: context.iconColor!.withOpacity(0.5),
                        ),
                        Icon(
                          TablerIcons.chevron_down,
                          size: 16,
                          color: context.iconColor!.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
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
  const NavLink({super.key, required this.nav});
  final NavbarMenu nav;

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
          color: isHover
              ? context.theme.iconTheme.color!.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              widget.nav.icon,
              size: 18,
              color:
                  context.theme.iconTheme.color!.withOpacity(isHover ? 1 : 0.5),
            ),
            const Width5(),
            Text(
              widget.nav.label,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.theme.iconTheme.color!
                    .withOpacity(isHover ? 1 : 0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
