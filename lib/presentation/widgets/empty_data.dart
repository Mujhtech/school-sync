import 'package:flutter/widgets.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, this.action, this.label});

  final void Function()? action;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CustomHeight(
            height: context.screenHeight(0.35),
          ),
          Text(
            AppString.nothingToSeeHere,
            style: context.textTheme.bodySmall,
          ),
          if (action != null) ...<Widget>[
            const Height15(),
            PrimaryButton(
              width: 120,
              height: 35,
              label: label ?? AppString.action,
              icon: Icon(
                TablerIcons.plus,
                color: context.buttonTextColor,
                size: 16,
              ),
              iconPosition: IconPosition.left,
              onPressed: () => action?.call(),
            )
          ]
        ],
      ),
    );
  }
}
