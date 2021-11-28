// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:responsive/flex_builder.dart';
import 'package:responsive/responsive.dart';

import 'logic.dart';

// ignore: must_be_immutable
class FlexWidget extends FlexBuilderWidget {
  FlexWidget({
    Widget? child,
    FlexBuilder? builder,
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
  })  : assert(builder == null || child == null),
        super(
            builder: builder ??
                (BuildContext context, double width, double offset,
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
                    return SizedBox(
                      width: width,
                      child: child,
                    );
                  }
                },
            xs: xs,
            xsOffset: xsOffset,
            xsLand: xsLand,
            xsLandOffset: xsLandOffset,
            sm: sm,
            smOffset: smOffset,
            smLand: smLand,
            smLandOffset: smLandOffset,
            md: md,
            mdOffset: mdOffset,
            mdLand: mdLand,
            mdLandOffset: mdLandOffset,
            lg: lg,
            lgOffset: lgOffset,
            lgLand: lgLand,
            lgLandOffset: lgLandOffset,
            xl: xl,
            xlOffset: xlOffset,
            xlLand: xlLand,
            xlLandOffset: xlLandOffset,
            xxl: xxl,
            xxlLand: xxlLand,
            xxlLandOffset: xxlLandOffset,
            xxlOffset: xxlOffset,
            xxxl: xxxl,
            xxxlLand: xxxlLand,
            xxxlLandOffset: xxlLandOffset,
            xxxlOffset: xxxlOffset);
}
