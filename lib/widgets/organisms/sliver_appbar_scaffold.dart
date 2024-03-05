import 'package:flutter/material.dart';

class SliverAppbarScaffold extends StatelessWidget {
  final String title;
  final Widget? expandedWidget;
  final Widget? leading;
  final double? expandedHeight;
  final Widget? collapsedWidget;
  final double? bottomSpace;
  final double? topSpace;
  final ScrollController? customScrollController;
  final List<Widget>? actions;
  final ScrollPhysics? physics;
  final SliverPersistentHeaderDelegate? delegate;
  final BorderRadius? borderRadius;
  final Widget child;
  const SliverAppbarScaffold(
      {super.key,
      required this.title,
      this.expandedWidget,
      this.collapsedWidget,
      this.expandedHeight = 250.0,
      this.bottomSpace = 100.0,
      this.topSpace = 20,
      this.physics = const BouncingScrollPhysics(),
      this.customScrollController,
      this.leading,
      this.actions,
      this.delegate,
      this.borderRadius,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: customScrollController,
          physics: physics!,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: delegate ??
                    CustomSliverAppbarDelegate(
                        borderRadius: borderRadius,
                        expandedHeight: expandedHeight!,
                        onExpandedWidget: expandedWidget,
                        collapsedWidget: collapsedWidget ??
                            AppBar(
                              leading: leading,
                              title: Text(title),
                              actions: actions,
                              elevation: 0,
                              centerTitle: true,
                            )),
                pinned: true,
              )
            ];
          },
          body: Container(
            margin: EdgeInsets.only(top: topSpace!),
            child: child,
          )),
    );
  }
}

// custom sliver appbar delegate
class CustomSliverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget? onExpandedWidget;
  final Widget collapsedWidget;
  final BorderRadius? borderRadius;

  const CustomSliverAppbarDelegate(
      {required this.expandedHeight,
      required this.collapsedWidget,
      this.onExpandedWidget,
      this.borderRadius});

  @override
  double get minExtent => kToolbarHeight + 56;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
      borderRadius: borderRadius ??
          const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
      child: Stack(
        children: [
          onExpandedWidget ?? Container(),

          // show collapsed widget (normally appbar, title and actions)
          Opacity(
              opacity: (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0),
              child: collapsedWidget),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant CustomSliverAppbarDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight ||
        onExpandedWidget != oldDelegate.onExpandedWidget;
  }
}
