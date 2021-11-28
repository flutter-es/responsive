import 'package:flutter/material.dart';
import 'package:responsive/flex_builder.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/responsive_row.dart';

import 'logic.dart';
import 'responsive.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget drawer;
  final Widget body;
  final AppBar appBar;

  const ResponsiveScaffold(
      {required this.drawer,
      required this.appBar,
      required this.body,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexBuilderWidget(
      builder:
          (BuildContext context, double width, double offset, ScreenSize size) {
        switch (size) {
          case ScreenSize.sm:
          case ScreenSize.xs:
          case ScreenSize.md:
            return getSmallWidget(context);

          case ScreenSize.lg:
          case ScreenSize.xl:
          case ScreenSize.xxl:
          case ScreenSize.xxxl:
            return getBigWidget(context);
        }
      },
    );
  }

  Widget getSmallWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      drawer: drawer,
    );
  }

  Widget getBigWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ResponsiveRow(
        children: <Widget>[
          FlexWidget(
            child: drawer,
          ),
          FlexWidget(
            child: body,
          ),
        ],
      ),
    );
  }
}
