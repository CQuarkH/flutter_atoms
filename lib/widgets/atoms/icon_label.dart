import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final TextStyle? textStyle;
  final double? spacing;
  final String label;
  const IconLabel(
      {super.key,
      required this.icon,
      required this.label,
      this.iconSize = 14,
      this.spacing = 8,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize!,
        ),
        SizedBox(width: spacing!),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.clip,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
