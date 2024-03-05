import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget {
  final List<Widget> children;
  final double? space;

  const SpacedRow({Key? key, required this.children, this.space = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildSeparatedChildren(),
    );
  }

  List<Widget> _buildSeparatedChildren() {
    List<Widget> separatedChildren = [];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i != children.length - 1) {
        separatedChildren.add(SizedBox(width: space));
      }
    }

    return separatedChildren;
  }
}
