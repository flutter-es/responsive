library responsive;

import 'package:flutter/widgets.dart';

class ResponsiveRow extends StatelessWidget {
  final int columnsCount;
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;

  final TextDirection textDirection;

  final VerticalDirection verticalDirection;
  final List<Widget> children;

  ResponsiveRow(
      {this.children,
      this.columnsCount,
      this.direction = Axis.horizontal,
      this.alignment = WrapAlignment.start,
      this.spacing = 0.0,
      this.runAlignment = WrapAlignment.start,
      this.runSpacing = 0.0,
      this.crossAxisAlignment = WrapCrossAlignment.start,
      this.textDirection,
      this.verticalDirection = VerticalDirection.down});

  @override
  Widget build(BuildContext context) {

    return Wrap(
        key: key,
        children: children,
        direction: Axis.horizontal,
        alignment: alignment,
        spacing: spacing,
        runAlignment: runAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection);
  }
}
