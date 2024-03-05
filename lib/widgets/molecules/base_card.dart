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
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: GestureDetector(
          onTap: onTap,
          child: Hero(
              tag: heroTag ?? '',
              child: ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor ?? Theme.of(context).cardTheme.color,
                    border: border,
                    boxShadow: boxShadow ??
                        [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(1, 2),
                          )
                        ],
                    image: backgroundImage != null
                        ? DecorationImage(
                            image: backgroundImage!, fit: BoxFit.cover)
                        : null,
                  ),
                  child: SpacedColumn(children: [
                    if (header != null) header!,
                    body,
                    if (footer != null) footer!,
                  ]),
                ),
              ))),
    );
  }
}
