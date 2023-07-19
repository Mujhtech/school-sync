import 'package:flutter/material.dart';

import 'package:school_sync/presentation.dart';
import 'package:school_sync/presentation/widgets/loading_spinner.dart';

enum IconPosition { left, right }

class PrimaryButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool loading;
  final bool disable;
  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double height;
  final Widget? icon;
  final double radius;
  final Color borderColor;
  final IconPosition? iconPosition;
  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.disable = false,
      this.buttonColor,
      this.textColor,
      this.width,
      this.height = 50,
      this.loading = false,
      this.icon,
      this.iconPosition = IconPosition.right,
      this.radius = 10,
      this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool loading = false;
  bool disable = false;

  init() {
    loading = widget.loading;
    disable = widget.disable;
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void didUpdateWidget(PrimaryButton oldWidget) {
    if (oldWidget.disable != widget.disable ||
        oldWidget.loading != widget.loading) {
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverElevation: 0,
      elevation: 0,
      onPressed: () {
        if (loading || disable) {
          return;
        }
        widget.onPressed();
      },
      color: widget.buttonColor ??
          Colors.black.withOpacity(disable == true ? 0.3 : 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          side: BorderSide(
              color: widget.borderColor, width: 1, style: BorderStyle.solid)),
      child: Container(
        width: widget.width ?? context.screenWidth(1),
        height: widget.height,
        alignment: Alignment.center,
        child: loading
            ? Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: LoadingSpinner.circle(
                      strokeWidth: 2,
                      size: 10,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    )),
              )
            : widget.icon != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.iconPosition == IconPosition.left) ...[
                        widget.icon!,
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                      Text(widget.label,
                          style: context.textTheme.titleSmall!.copyWith(
                              color: widget.textColor ?? Colors.white)),
                      if (widget.iconPosition == IconPosition.right) ...[
                        const SizedBox(
                          width: 10,
                        ),
                        widget.icon!
                      ]
                    ],
                  )
                : Text(widget.label,
                    style: context.textTheme.titleSmall!
                        .copyWith(color: widget.textColor ?? Colors.white)),
      ),
    );
  }
}
