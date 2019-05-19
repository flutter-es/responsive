import 'package:flutter/material.dart';

mixin Responsive {
  static const int xs = 1;
  static const int sm = 2;
  static const int md = 3;
  static const int lg = 4;
  static const int xl = 5;
  static const int xxl = 6;
  static const int xxxl = 7;

  /// Map to translate gridsize id to a name
  Map<int, String> gridName = {
    xs: 'xs',
    sm: 'sm',
    md: 'md',
    lg: 'lg',
    xl: 'xl',
    xxl: 'xxl',
    xxxl: 'xxxl',
  };

  /// Columns offset for each grid type
  Map<int, int> offsets = {
    xs: 0,
    sm: 0,
    md: 0,
    lg: 0,
    xl: 0,
    xxl: 0,
    xxxl: 0,
  };

  /// Columns offset for each grid type and the device is landscape
  Map<int, int> offsetsLand = {
    xs: 0,
    sm: 0,
    md: 0,
    lg: 0,
    xl: 0,
    xxl: 0,
    xxxl: 0,
  };

  /// Columns counts for each grid type
  Map<int, int> columns = {
    xs: 12,
    sm: 6,
    md: 6,
    lg: 3,
    xl: 3,
    xxl: 1,
    xxxl: 1,
  };

  /// Columns counts for each grid type and the device is landscape
  Map<int, int> columnsLand = {
    xs: 12,
    sm: 6,
    md: 6,
    lg: 3,
    xl: 3,
    xxl: 1,
    xxxl: 1,
  };

  /// Calc the width in pixels, for the screen and rotation config used actually in the device
  double calcWidth(Size size, Orientation orientation, int columnsCount) {
    final width =
        orientation == Orientation.portrait ? size.width : size.height;
    final colWidth = width / columnsCount;

    return colWidth * columns[gridSize(size.width)];
  }

  /// Calc the offset in pixels, for the screen and rotation config used actually in the device
  double calcOffset(Size size, Orientation orientation, int columnsCount) {
    final width =
        orientation == Orientation.portrait ? size.width : size.height;
    final colWidth = width / columnsCount;
    final orientedOffsets =
        orientation == Orientation.portrait ? offsets : offsetsLand;
    return colWidth * orientedOffsets[gridSize(size.width)];
  }

  /// Calc the number of columns, for the screen and rotation config used actually in the device
  static int calcColumns(
      {Size size,
      Orientation orientation,
      Columns columns,
      BuildContext context}) {
    if (context != null) {
      size = MediaQuery.of(context).size;
      orientation = MediaQuery.of(context).orientation;
    }
    return columns.values[gridSize(size.width)];
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
    } else if (width >= 1200 && width < 1366) {
      sizeName = xl;
    } else if (width >= 1366 && width < 1440) {
      sizeName = xxl;
    } else if (width >= 1440) {
      sizeName = xxxl;
    }

    return sizeName;
  }
}

class Columns {
  /// Columns counts for each grid type and the device is landscape
  Map<int, int> values = {};

  /// Constructor
  Columns(
      {@required int xs, int sm, int md, int lg, int xl, int xxl, int xxxl}) {
    values[Responsive.xs] = xs;
    values[Responsive.sm] = sm ?? values[Responsive.xs];
    values[Responsive.md] = md ?? values[Responsive.sm];
    values[Responsive.lg] = lg ?? values[Responsive.md];
    values[Responsive.xl] = xl ?? values[Responsive.lg];
    values[Responsive.xxl] = xxl ?? values[Responsive.xl];
    values[Responsive.xxxl] = xxxl ?? values[Responsive.xxl];
  }
}
