import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.focusNode,
    this.label,
    this.content,
    this.textCapitalization,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.inputFormatters,
    this.onSubmitted,
    this.textInputAction,
    this.maxLength,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;

  final void Function(String)? onSubmitted;

  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final String? label;
  final String? content;
  final String hint;

  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.greyExt2, width: 2),
      ),
      padding: EdgeInsets.only(top: label != null ? 24 : 0, bottom: maxLength != null ? 16 : 0),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction ?? TextInputAction.next,
        inputFormatters: inputFormatters ?? [],
        cursorColor: context.colorScheme.primary,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        style: context.textTheme.bodyLarge?.semibold?.copyWith(
          color: context.colorScheme.black,
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          isDense: true,
          label: label != null
              ? Text(
                  label ?? '',
                  style: context.textTheme.titleSmall?.semibold.cColor(context.colorScheme.greyExt1),
                )
              : null,
          hint: Text(
            hint,
            style: context.textTheme.bodyLarge?.semibold.cColor(context.colorScheme.greyExt1),
          ),
          contentPadding: const EdgeInsets.all(12),
        ),
        minLines: minLines,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
      ),
    );
  }
}
