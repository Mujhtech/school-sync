import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: context.screenHeight(0.85),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.backgroundColor,
        borderRadius: AppBorderRadius.xl,
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: context.textTheme.bodyLarge,
              fillColor: Colors.transparent,
              hoverColor: Colors.transparent,
              prefixIcon: Icon(
                TablerIcons.search,
                size: 20,
                color: context.iconColor,
              ),
              suffixIcon: HyperLink(
                onTap: () => context.router.goBack(),
                child: Icon(
                  TablerIcons.x,
                  size: 20,
                  color: context.iconColor,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(),
          )
        ],
      ),
    );
  }
}
