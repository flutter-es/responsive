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
      this.columnsCount = 12,
      this.direction = Axis.horizontal,
      this.alignment = WrapAlignment.start,
      this.spacing = 0.0,
      this.runAlignment = WrapAlignment.start,
      this.runSpacing = 0.0,
      this.crossAxisAlignment = WrapCrossAlignment.start,
      this.textDirection,
      this.verticalDirection = VerticalDirection.down})
      : assert(children != null),
        assert(columnsCount > 0);

  @override
  Widget build(BuildContext context) {
    //Use a simple Wrap :-)

    return ResponsiveSettings(
        this.columnsCount,
        Wrap(
            key: key,
            children: children,
            direction: Axis.horizontal,
            alignment: alignment,
            spacing: spacing,
            runAlignment: runAlignment,
            crossAxisAlignment: crossAxisAlignment,
            textDirection: textDirection,
            verticalDirection: verticalDirection));
  }
}


class ResponsiveSettings extends InheritedWidget {
  final int columnsCount;

  ResponsiveSettings(this.columnsCount, Widget child) : super(child: child);

  @override
  bool updateShouldNotify(ResponsiveSettings old) =>
      columnsCount != old.columnsCount;

  static ResponsiveSettings of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ResponsiveSettings);
  }
}
