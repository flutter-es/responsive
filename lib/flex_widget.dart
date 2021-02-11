// Copyright 2019 Marvin Quevedo. All rights reserved.
// Use of this source code is governed by a Apache 2.0 license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:responsive/flex_builder.dart';
import 'package:responsive/responsive.dart';

// ignore: must_be_immutable
class FlexWidget extends FlexBuilderWidget {
  FlexWidget(
      {Widget child,
      FlexBuilder builder,
      xs = 12,
      xsOffset = 0,
      xsLand,
      xsLandOffset,
      sm,
      smOffset = 0,
      smLand,
      smLandOffset,
      md,
      mdOffset = 0,
      mdLand,
      mdLandOffset,
      lg,
      lgOffset = 0,
      lgLand,
      lgLandOffset,
      xl,
      xlOffset = 0,
      xlLand,
      xlLandOffset})
      : assert(builder == null || child == null),
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
            xlLandOffset: xlLandOffset);
}
