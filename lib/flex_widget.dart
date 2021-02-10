// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/responsive_row.dart';

// ignore: must_be_immutable
class FlexWidget extends StatelessWidget with Responsive {
  /// Child for apply the flex Columns
  final Widget child;

  FlexWidget({
    this.child,
    int xs = 12,
    int xsOffset = 0,
    int xsLand,
    int xsLandOffset,
    int sm = 6,
    int smOffset = 0,
    int smLand,
    int smLandOffset,
    int md = 6,
    int mdOffset = 0,
    int mdLand,
    int mdLandOffset,
    int lg = 3,
    int lgOffset = 0,
    int lgLand,
    int lgLandOffset,
    int xl = 3,
    int xlOffset = 0,
    int xlLand = 0,
    int xlLandOffset,
    int xxl = 3,
    int xxlOffset = 0,
    int xxlLand,
    int xxlLandOffset,
    int xxxl = 3,
    int xxxlOffset = 0,
    int xxxlLand,
    int xxxlLandOffset,
  }) {
    columns = Columns(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
    ).values;
    columnsLand = Columns(
            xs: xsLand ?? xs,
            sm: smLand ?? sm,
            md: mdLand ?? md,
            lg: lgLand ?? lg,
            xl: xlLand ?? xl,
            xxl: xxlLand ?? xxl,
            xxxl: xxxlLand ?? xxxl)
        .values;
    offsets[Responsive.xs] = xsOffset;
    offsets[Responsive.sm] = smOffset;
    offsets[Responsive.md] = mdOffset;
    offsets[Responsive.lg] = lgOffset;
    offsets[Responsive.xl] = xlOffset;
    offsets[Responsive.xxl] = xxlOffset;
    offsets[Responsive.xxxl] = xxxlOffset;

    offsetsLand[Responsive.xs] = xsLandOffset ?? xsOffset;
    offsetsLand[Responsive.sm] = smLandOffset ?? smOffset;
    offsetsLand[Responsive.md] = mdLandOffset ?? mdOffset;
    offsetsLand[Responsive.lg] = lgLandOffset ?? lgOffset;
    offsetsLand[Responsive.xl] = xlLandOffset ?? xlOffset;
    offsetsLand[Responsive.xxl] = xxlLandOffset ?? xxlOffset;
    offsetsLand[Responsive.xxxl] = xxxlLandOffset ?? xxxlOffset;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final settings = ResponsiveRowSettings.of(context);
    if (settings == null) {
      throw Exception("The FlexWidget is not into a ResponsiveRow");
    }
    final columnsCount = settings.columnsCount;
    final gridSizeValue = Responsive.gridSize(size.width);
    if (columns[gridSizeValue] > columnsCount) {
      throw Exception(
          "${gridName[gridSizeValue]} is bigger than columnsCount: ${columns[gridSizeValue]}  > $columnsCount");
    }

    final offset = calcOffset(size, orientation, columnsCount);
    if (offset > 0.0) {
      return Container(
        margin: EdgeInsets.only(left: offset),
        child: SizedBox(
          width: calcWidth(size, orientation, columnsCount),
          child: this.child,
        ),
      );
    } else {
      return SizedBox(
        width: calcWidth(size, orientation, columnsCount),
        child: this.child,
      );
    }
  }
}
