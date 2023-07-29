import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_sync/presentation.dart';
import 'package:tabler_icons/tabler_icons.dart';

class PrimaryTextFormField extends StatelessWidget {
  const PrimaryTextFormField({
    this.hasTitle = false,
    this.controller,
    this.title,
    this.hint,
    this.prefix,
    this.initialValue,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.autofillHints,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.filled = true,
    this.obscure = false,
    this.autocorrect = false,
    this.alignedColumn = CrossAxisAlignment.start,
    this.radius = 10,
    this.autofocus = false,
    this.textInputAction,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  }) : assert(initialValue == null || controller == null);
  final bool hasTitle;
  final bool readOnly;
  final bool obscure;
  final bool autocorrect;
  final bool filled;
  final bool autofocus;
  final String? title;
  final String? initialValue;
  final String? hint;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final CrossAxisAlignment alignedColumn;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final double radius;
  final List<String>? autofillHints;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;

  static PrimaryTextFormField password({
    required bool Function() onTap,
    required bool isVisible,
    required TextEditingController? controller,
    required BuildContext context,
  }) =>
      PrimaryTextFormField(
        hint: 'Password',
        controller: controller,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        validator: (String? p0) {
          if (p0 == null || p0.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
        suffixIcon: GestureDetector(
          onTap: () => onTap.call(),
          onLongPress: () => onTap.call(),
          onLongPressUp: () => onTap.call(),
          child: Icon(
            isVisible ? TablerIcons.eye_off : TablerIcons.eye,
            color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
          ),
        ),
        obscure: !isVisible,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignedColumn,
      children: <Widget>[
        if (hasTitle) ...<Widget>[
          Text(title!, style: Theme.of(context).textTheme.headlineSmall),
          const Height10()
        ],
        TextFormField(
          autofillHints: autofillHints,
          initialValue: initialValue,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          textInputAction: textInputAction,
          onSaved: onSaved,
          textAlign: textAlign,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          cursorColor: context.textColor,
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.normal,
          ),
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.all(10),
            prefix: prefix,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.textColor.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.textColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.textColor),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            filled: filled,
            hintText: hint,
            hintStyle: context.textTheme.bodySmall!.copyWith(
              color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.textColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal, color: Colors.red),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          autocorrect: autocorrect,
          autofocus: autofocus,
          obscureText: obscure,
        ),
      ],
    );
  }
}
