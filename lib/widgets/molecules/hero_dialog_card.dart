import 'package:flutter/material.dart';

// hero card for dialog
// this card must be used with HeroDialogRoute
class HeroDialogCard extends StatelessWidget {
  final String heroTag;
  final EdgeInsets? padding;
  final Color? color;
  final Widget child;
  const HeroDialogCard(
      {super.key,
      required this.heroTag,
      this.padding,
      this.color,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Hero(
            tag: heroTag,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color ?? Theme.of(context).cardTheme.color,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              child: SingleChildScrollView(
                  child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: padding ?? const EdgeInsets.all(16.0),
                        child: child,
                      ))),
            )),
      ),
    );
  }
}
