import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight(0.4),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        borderRadius: AppBorderRadius.lg,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        ],
      ),
    );
  }
}
