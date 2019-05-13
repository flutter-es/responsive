// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'responsive.dart';

// ignore: must_be_immutable
class FlexWidget extends StatelessWidget {
  /// Child for apply the flex Columns
  final Widget child;

  /// Columns counts for less than 768
  final double xs;

  /// Columns offset for less than 768
  final double xsOffset;

  /// Columns counts for less than 768 and the device is landscape
  double xsLand;

  /// Columns offset for less than 768 and the device is landscape
  double xsLandOffset;

  /// Columns counts for more or equals to 768 pixels
  final double sm;

  /// Columns offset for more or equals to 768 pixels
  final double smOffset;

  /// Columns counts for more or equals to 768 pixels and the device is landscape
  double smLand;

  /// Columns offset for more or equals to 768 pixels and the device is landscape
  double smLandOffset;

  ///Columns counts for more or equals to 992 pixels
  final double md;

  /// Columns offset for more or equals to 992 pixels
  final double mdOffset;

  /// Columns counts for more or equals to 992 pixels and the device is landscape
  double mdLand;

  /// Columns offset for more or equals to 992 pixels and the device is landscape
  double mdLandOffset;

  ///Columns counts for more or equals to 1170 pixels
  final double lg;

  /// Columns offset for more or equals to 1170 pixels
  final double lgOffset;

  /// Columns counts for more or equals to 1170 pixels and the device is landscape
  double lgLand;

  /// Columns offset for more or equals to 1170 pixels and the device is landscape
  double lgLandOffset;

  FlexWidget(
      {this.child,
      this.xs = 12,
      this.xsOffset = 0,
      this.xsLand,
      this.xsLandOffset,
      this.sm = 6,
      this.smOffset = 0,
      this.smLand,
      this.smLandOffset,
      this.md = 6,
      this.mdOffset = 0,
      this.mdLand,
      this.mdLandOffset,
      this.lg = 3,
      this.lgOffset = 0,
      this.lgLand,
      this.lgLandOffset}) {
    if (xsLand == null) {
      xsLand = xs;
    }
    if (smLand == null) {
      smLand = sm;
    }
    if (mdLand == null) {
      mdLand = md;
    }
    if (lgLand == null) {
      lgLand = lg;
    }

    if (xsLandOffset == null) {
      xsLandOffset = xsOffset;
    }
    if (smLandOffset == null) {
      smLandOffset = smOffset;
    }

    if (mdLandOffset == null) {
      mdLandOffset = mdOffset;
    }
    if (lgLandOffset == null) {
      lgLandOffset = lgOffset;
    }
  }

  @override
  Widget build(BuildContext context) {
    //obtain the screen size
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final settings = ResponsiveSettings.of(context);
    if (settings == null) {
      throw Exception("The FlexWidget is not into a ResponsiveRow");
    }
    final columnsCount = settings.columnsCount;

    if (lg > columnsCount) {
      throw Exception("lg is bigger than columnsCount = $lg  > $columnsCount");
    } else if (md > columnsCount) {
      throw Exception("md is bigger than columnsCount = $md  > $columnsCount");
    } else if (sm > columnsCount) {
      throw Exception("sm is bigger than columnsCount = $sm  > $columnsCount");
    } else if (xs > columnsCount) {
      throw Exception("xs is bigger than columnsCount = $xs  > $columnsCount");
    }

    //use the OrientationBuilder Widget
    //for change the size width, depends of the orientation

    final offset = _calcOffset(size, orientation, columnsCount);

    final child = SizedBox(
      width: _calcWidth(size, orientation, columnsCount),
      child: this.child,
    );

    if (offset > 0.0) {
      return Container(
          margin: EdgeInsets.only(left: offset),
          child: SizedBox(
            width: _calcWidth(size, orientation, columnsCount),
            child: this.child,
          ));
    } else {
      return child;
    }
  }

  /// Calc the width in pixels, for the screen and rotation config used actually in the device
  double _calcWidth(Size size, Orientation orientation, columnsCount) {
    final width = size.width;
    if (orientation == Orientation.portrait) {
      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        return colWidth * lg;
      } else if (width >= 992) {
        return colWidth * md;
      } else if (width >= 768) {
        return colWidth * sm;
      } else {
        return colWidth * xs;
      }
    } else {
      //Landscape configuration

      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        return colWidth * lgLand;
      } else if (width >= 992) {
        return colWidth * mdLand;
      } else if (width >= 768) {
        return colWidth * smLand;
      } else {
        return colWidth * xsLand;
      }
    }
  }

  double _calcOffset(Size size, Orientation orientation, columnsCount) {
    if (orientation == Orientation.portrait) {
      final width = size.width;

      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        return colWidth * lgOffset;
      } else if (width >= 992) {
        return colWidth * mdOffset;
      } else if (width >= 768) {
        return colWidth * smOffset;
      } else {
        return colWidth * xsOffset;
      }
    } else {
      //Landscape configuration
      final width = size.height;
      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        return colWidth * lgLandOffset;
      } else if (width >= 992) {
        return colWidth * mdLandOffset;
      } else if (width >= 768) {
        return colWidth * smLandOffset;
      } else {
        return colWidth * xsLandOffset;
      }
    }
  }
}
