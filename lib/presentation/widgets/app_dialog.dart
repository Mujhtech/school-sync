import 'package:flutter/material.dart';

class AppDialog {
  AppDialog({
    required this.context,
    required this.content,
    this.width = 80,
    this.bgColor,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 5,
    this.barrierDismissible = true,
  });
  final Widget content;
  BuildContext context;
  final double width;
  final double borderRadius;
  final bool barrierDismissible;
  final Color? bgColor;
  final EdgeInsets padding;

  Future<T?> show<T extends Object?>() {
    return showGeneralDialog(
      context: context,
      barrierLabel: 'Barrier',
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: padding,
                  decoration: BoxDecoration(
                    color: bgColor ?? Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: content,
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, Animation<double> anim, __, Widget child) {
        Tween<Offset> tween;

        Tween<Offset> setTween([double dx = 1, double dy = 0]) {
          return Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);
        }

        tween =
            anim.status == AnimationStatus.reverse ? setTween(0) : setTween(-1);

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
