// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:responsive/flex_builder.dart';
import 'package:responsive/responsive.dart';

import 'logic.dart';

// ignore: must_be_immutable
class FlexPersonalizableWidget extends StatelessWidget with Responsive {
  Widget child;
  FlexPersonalizableWidget(
    this.child, {
    int xs = 12,
    int xsOffset = 0,
    int? xsLand,
    int? xsLandOffset,
    int sm = 6,
    int smOffset = 0,
    int? smLand,
    int? smLandOffset,
    int md = 6,
    int mdOffset = 0,
    int? mdLand,
    int? mdLandOffset,
    int lg = 3,
    int lgOffset = 0,
    int? lgLand,
    int? lgLandOffset,
    int xl = 3,
    int xlOffset = 0,
    int xlLand = 0,
    int? xlLandOffset,
    int xxl = 3,
    int xxlOffset = 0,
    int? xxlLand,
    int? xxlLandOffset,
    int xxxl = 3,
    int xxxlOffset = 0,
    int? xxxlLand,
    int? xxxlLandOffset,
  }) {
    columns = FlexColumns(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
    ).values;
    columnsLand = FlexColumns(
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
    var flexWidget = FlexBuilderWidget(
      builder: (BuildContext context, double width, double offset,
          ScreenSize screenSize) {
        if (offset > 0.0) {
          return Container(
            margin: EdgeInsets.only(left: offset),
            child: SizedBox(
              width: width,
              child: child,
            ),
          );
        } else {
          print("width $width");
          return SizedBox(
            width: width,
            child: child,
          );
        }
      },
    );

    //Complete the grid settings
    flexWidget.columns = this.columns;
    flexWidget.columnsLand = this.columnsLand;
    flexWidget.offsets = this.offsets;
    flexWidget.offsetsLand = this.offsetsLand;
    return flexWidget;
  }

  /// Do a copy of the object with other child
  FlexPersonalizableWidget copyWith(Widget child) {
    final flexObject = new FlexPersonalizableWidget(child);

    //Complete the grid settings
    flexObject.columns = this.columns;
    flexObject.columnsLand = this.columnsLand;
    flexObject.offsets = this.offsets;
    flexObject.offsetsLand = this.offsetsLand;
    return flexObject;
  }
}
