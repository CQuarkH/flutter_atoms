import 'package:flutter/material.dart';

class SpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final double? space;
  const SpacedColumn({super.key, required this.children, this.space = 8});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildSeparatedChildren(),
    );
  }

  List<Widget> _buildSeparatedChildren() {
    List<Widget> separatedChildren = [];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i != children.length - 1) {
        separatedChildren.add(SizedBox(height: space));
      }
    }

    return separatedChildren;
  }
}
