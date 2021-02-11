// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/responsive_row.dart';

typedef FlexBuilder = Widget Function(
  BuildContext context,
  double width,
  double offset,
  ScreenSize screenSize,
);

// ignore: must_be_immutable
class FlexBuilderWidget extends StatelessWidget with Responsive {
  /// builder according column calc
  final FlexBuilder builder;

  FlexBuilderWidget(
      {@required this.builder,
      xs = 12,
      xsOffset = 0,
      xsLand,
      xsLandOffset,
      sm = 6,
      smOffset = 0,
      smLand,
      smLandOffset,
      md = 6,
      mdOffset = 0,
      mdLand,
      mdLandOffset,
      lg = 3,
      lgOffset = 0,
      lgLand,
      lgLandOffset,
      xl = 3,
      xlOffset = 0,
      xlLand,
      xlLandOffset}) {
    columns = Columns(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
    ).values;
    columnsLand = Columns(
      xs: xsLand ?? xs,
      sm: smLand ?? sm,
      md: mdLand ?? md,
      lg: lgLand ?? lg,
      xl: xlLand ?? xl,
    ).values;
    offsets[Responsive.xs] = xsOffset;
    offsets[Responsive.sm] = smOffset;
    offsets[Responsive.md] = mdOffset;
    offsets[Responsive.lg] = lgOffset;
    offsets[Responsive.xl] = xlOffset;
    offsetsLand[Responsive.xs] = xsLandOffset ?? xsOffset;
    offsetsLand[Responsive.sm] = smLandOffset ?? smOffset;
    offsetsLand[Responsive.md] = mdLandOffset ?? mdOffset;
    offsetsLand[Responsive.lg] = lgLandOffset ?? lgOffset;
    offsetsLand[Responsive.xl] = xlLandOffset ?? xlOffset;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final settings = ResponsiveRowSettings.of(context);
    final flexSettings = FlexWidgetSettings.of(context);
    if (flexSettings?.size != null) {
      size = flexSettings.size;
      print(size);
    }
    final columnsCount = settings != null ? settings.columnsCount : 12;
    final gridSizeValue = Responsive.gridSize(size.width);
    if (columns[gridSizeValue] > columnsCount) {
      throw Exception(
          "${gridName[gridSizeValue]} is bigger than columnsCount: ${columns[gridSizeValue]}  > $columnsCount");
    }

    final offset = calcOffset(size, orientation, columnsCount);
    final width = calcWidth(size, orientation, columnsCount);
    final flexSize = Size(width, size.height);
    return FlexWidgetSettings(
      child: this.builder(
        context,
        width,
        offset,
        ScreenSize.values[Responsive.gridSize(width) - 1],
      ),
      size: flexSize,
    );
  }
}

class FlexWidgetSettings extends InheritedWidget {
  final Size size;
  FlexWidgetSettings({this.size, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(FlexWidgetSettings old) => size != old.size;

  static FlexWidgetSettings of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlexWidgetSettings>();
  }
}
