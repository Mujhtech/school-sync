import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class CustomSliverAppBarWithHeader extends SliverPersistentHeaderDelegate {
  const CustomSliverAppBarWithHeader({
    this.header,
    this.onSticky,
    this.isSticky = false,
    required this.title,
  });
  final Widget? header;
  final void Function(bool)? onSticky;
  final bool isSticky;
  final String title;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // if (onSticky != null) {
    //   final bool sticky = shrinkOffset < 50 ? false : true;

    //   if (isSticky != sticky) {
    //     onSticky!.call(sticky);
    //   }
    // }
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: context.screenWidth(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(
              right: shrinkOffset < 50 ? 20 : 0,
              left: shrinkOffset < 50 ? 20 : 0,
              top: shrinkOffset < 50 ? 10 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: shrinkOffset < 50 ? AppBorderRadius.lg : null,
              color:
                  context.cardColor!.withOpacity(shrinkOffset < 50 ? 0.5 : 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: shrinkOffset < 50
                      ? context.textTheme.headlineLarge
                      : context.textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
        if (header != null)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: shrinkOffset < 50 ? 20 : 40,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: shrinkOffset < 50 ? 20 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: shrinkOffset < 50 ? AppBorderRadius.lg : null,
              color:
                  context.cardColor!.withOpacity(shrinkOffset < 50 ? 0.5 : 1),
            ),
            child: header,
          )
      ],
    );
  }

  @override
  double get maxExtent => 170;

  @override
  double get minExtent => 105;

  @override
  bool shouldRebuild(CustomSliverAppBarWithHeader oldDelegate) {
    return true;
  }
}
