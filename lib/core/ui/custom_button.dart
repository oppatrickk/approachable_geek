import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelStyle,
    this.icon,
    this.enabled = true,
  });

  final String label;
  final TextStyle? labelStyle;
  final IconData? icon;

  final bool enabled;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? context.colorScheme.black : context.colorScheme.greyExt1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          shadowColor: enabled ? null : Colors.transparent,
          elevation: enabled ? 6 : 0,
          splashFactory: enabled ? null : NoSplash.splashFactory,
        ),
        onPressed: enabled ? () {} : onPressed,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: enabled ? context.colorScheme.white : context.colorScheme.greyExt2,
              ),
              horizontalSpace(8),
            ],
            Text(
              label,
              style: labelStyle ?? context.textTheme.bodyMedium?.semibold.cColor(enabled ? context.colorScheme.white : context.colorScheme.greyExt2),
            ),
          ],
        ),
      ),
    );
  }
}
