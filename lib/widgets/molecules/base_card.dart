import 'package:flutter/material.dart';
import 'package:flutter_atoms/widgets/molecules/spaced_column.dart';

class BaseCard extends StatelessWidget {
  final String? heroTag;
  final ImageProvider? backgroundImage;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? cardColor;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final Function()? onTap;
  final Widget? header;
  final Widget? footer;
  final Widget body;
  final double? spacing;
  const BaseCard(
      {super.key,
      this.backgroundImage,
      this.onTap,
      this.padding,
      this.borderRadius,
      this.heroTag,
      this.cardColor,
      this.boxShadow,
      this.border,
      this.header,
      this.footer,
      this.spacing,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Hero(
            tag: heroTag ?? '',
            child: Container(
              decoration: BoxDecoration(
                boxShadow: boxShadow ??
                    [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                      )
                    ],
              ),
              child: Container(
                padding: padding ?? const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor ?? Theme.of(context).cardTheme.color,
                  border: border,
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                  image: backgroundImage != null
                      ? DecorationImage(
                          image: backgroundImage!, fit: BoxFit.cover)
                      : null,
                ),
                child: SpacedColumn(space: spacing ?? 8, children: [
                  if (header != null) header!,
                  body,
                  if (footer != null) footer!,
                ]),
              ),
            )));
  }
}
