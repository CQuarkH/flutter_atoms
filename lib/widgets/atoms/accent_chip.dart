import 'package:flutter/material.dart';

class AccentChip extends StatelessWidget {
  final Color color;
  final String label;
  final EdgeInsets? padding;
  const AccentChip(
      {super.key, required this.color, required this.label, this.padding});

  @override
  Widget build(BuildContext context) {
    return Chip(
        padding: padding ?? const EdgeInsets.all(4),
        backgroundColor: color.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        label: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w500),
        ));
  }
}
