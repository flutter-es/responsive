// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'responsive.dart';

// ignore: must_be_immutable
class FlexWidget extends StatelessWidget {
  static const int xs = 1;
  static const int sm = 2;
  static const int md = 3;
  static const int lg = 4;
  static const int xl = 4;

  /// Columns offset for each grid type
  Map<int, String> gridName = {
    xs: 'xs',
    sm: 'sm',
    md: 'md',
    lg: 'lg',
    xl: 'xl',
  };

  /// Columns offset for each grid type
  Map<int, int> offsets = {
    xs: 0,
    sm: 0,
    md: 0,
    lg: 0,
    xl: 0,
  };

  /// Columns offset for each grid type and the device is landscape
  Map<int, int> offsetsLand = {
    xs: 0,
    sm: 0,
    md: 0,
    lg: 0,
    xl: 0,
  };

  /// Columns counts for each grid type
  Map<int, int> columns = {
    xs: 12,
    sm: 6,
    md: 6,
    lg: 3,
    xl: 3,
  };

  /// Columns counts for each grid type and the device is landscape
  Map<int, int> columnsLand = {
    xs: 12,
    sm: 6,
    md: 6,
    lg: 3,
    xl: 3,
  };

  /// Child for apply the flex Columns
  final Widget child;
  FlexWidget(
      {this.child,
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
    columns[FlexWidget.xs] = xs;
    columns[FlexWidget.sm] = sm;
    columns[FlexWidget.md] = md;
    columns[FlexWidget.lg] = lg;
    columns[FlexWidget.xl] = xl;
    columnsLand[FlexWidget.xs] = xsLand ?? xs;
    columnsLand[FlexWidget.sm] = smLand ?? sm;
    columnsLand[FlexWidget.md] = mdLand ?? md;
    columnsLand[FlexWidget.lg] = lgLand ?? lg;
    columnsLand[FlexWidget.xl] = xlLand ?? xl;
    offsets[FlexWidget.xs] = xsOffset;
    offsets[FlexWidget.sm] = smOffset;
    offsets[FlexWidget.md] = mdOffset;
    offsets[FlexWidget.lg] = lgOffset;
    offsets[FlexWidget.xl] = xlOffset;
    offsetsLand[FlexWidget.xs] = xsLandOffset ?? xsOffset;
    offsetsLand[FlexWidget.sm] = smLandOffset ?? smOffset;
    offsetsLand[FlexWidget.md] = mdLandOffset ?? mdOffset;
    offsetsLand[FlexWidget.lg] = lgLandOffset ?? lgOffset;
    offsetsLand[FlexWidget.xl] = xlLandOffset ?? xlOffset;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final settings = ResponsiveSettings.of(context);
    if (settings == null) {
      throw Exception("The FlexWidget is not into a ResponsiveRow");
    }
    final columnsCount = settings.columnsCount;
    final gridSizeValue = gridSize(size.width);
    if (columns[gridSizeValue] > columnsCount) {
      throw Exception(
          "${gridName[gridSizeValue]} is bigger than columnsCount: ${columns[gridSizeValue]}  > $columnsCount");
    }

    //use the OrientationBuilder Widget
    //for change the size width, depends of the orientation
    final offset = _calcOffset(size, orientation, columnsCount);
    Widget child = SizedBox(
      width: _calcWidth(size, orientation, columnsCount),
      child: this.child,
    );

    if (offset > 0.0) {
      child = Container(
        margin: EdgeInsets.only(left: offset),
        child: SizedBox(
          width: _calcWidth(size, orientation, columnsCount),
          child: this.child,
        ),
      );
    }

    return child;
  }

  /// Calc the width in pixels, for the screen and rotation config used actually in the device
  double _calcWidth(Size size, Orientation orientation, columnsCount) {
    final width = size.width;
    final colWidth = width / columnsCount;
    final orientedColumns = orientation == Orientation.portrait ? columns : columnsLand;
    return colWidth * orientedColumns[gridSize(size.width)];
  }

  double _calcOffset(Size size, Orientation orientation, columnsCount) {
    final width = orientation == Orientation.portrait ? size.width : size.height;
    final colWidth = width / columnsCount;
    final orientedOffsets = orientation == Orientation.portrait ? offsets : offsetsLand;
    return colWidth * orientedOffsets[gridSize(size.width)];
  }

  /// Method to return grid size name
  static int gridSize(double width) {
    var sizeName = xs;
    if (width >= 576 && width < 768) {
      sizeName = sm;
    } else if (width >= 768 && width < 992) {
      sizeName = md;
    } else if (width >= 992 && width < 1200) {
      sizeName = lg;
    } else if (width >= 1200) {
      sizeName = xl;
    }

    return sizeName;
  }
}
