import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class NavLink extends StatefulWidget {
  const NavLink({
    super.key,
    required this.nav,
    required this.onClicked,
    this.currentMenu,
  });
  final NavbarMenu nav;
  final void Function(NavbarMenuEnum?) onClicked;
  final NavbarMenuEnum? currentMenu;

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool isHover = false;
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  set isOpen(bool val) {
    _isOpen = val;
    setState(() {});
  }

  bool get hasSubMenu =>
      widget.nav.subMenu != null && widget.nav.subMenu!.isNotEmpty;

  bool get isActive => widget.currentMenu == widget.nav.menu;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hasSubMenu ? isOpen = !_isOpen : widget.onClicked.call(null),
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
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                if (hasSubMenu) ...<Widget>[
                  Icon(
                    _isOpen
                        ? TablerIcons.chevron_down
                        : TablerIcons.chevron_right,
                    size: 15,
                    color: context.theme.iconTheme.color!
                        .withOpacity(isHover || isActive ? 1 : 0.5),
                  ),
                  const Width3(),
                ],
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: isHover || isActive
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
                            .withOpacity(isHover || isActive ? 1 : 0.5),
                      ),
                      const Width5(),
                      Text(
                        widget.nav.label,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.theme.iconTheme.color!.withOpacity(
                            isHover || isActive ? 1 : 0.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            if (hasSubMenu && _isOpen) ...<Widget>[
              const Height5(),
              ...widget.nav.subMenu!
                  .mapIndexed(
                    (int index, NavbarMenu e) => Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Width15(),
                            NavLink(
                              nav: e,
                              currentMenu: widget.currentMenu,
                              onClicked: (NavbarMenuEnum? val) =>
                                  widget.onClicked.call(e.menu),
                            ),
                          ],
                        ),
                        if (widget.nav.subMenu!.length > 1 &&
                            index < widget.nav.subMenu!.length - 1)
                          const Height5()
                      ],
                    ),
                  )
                  .toList()
            ]
          ],
        ),
      ),
    );
  }
}
