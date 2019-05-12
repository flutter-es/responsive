import 'package:flutter/widgets.dart';

import 'responsive.dart';

class FlexWidget extends StatelessWidget {
  final Widget child;
  //Columns counts for less than 768
  final double xs;
  final double xsOffset;
  double xsLand;
  double xsLandOffset;

  //Columns counts for more or equals to 768
  final double sm;
  final double smOffset;

  double smLand;
  double smLandOffset;
  //Columns counts for more or equals to 992
  final double md;
  final double mdOffsset;

  double mdLand;
  double mdLandOffset;
  //Columns counts for more or equals to 1170
  final double lg;
  final double lgOffset;

  double lgLand;
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
      this.mdOffsset = 0,
      this.mdLand,
      this.mdLandOffset,
      this.lg = 3,
      this.lgOffset = 0,
      this.lgLand,
      this.lgLandOffset}) {

    // C
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
      mdLandOffset = mdOffsset;
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

    final columnsCount = ResponsiveSettings.of(context).columnsCount;

    if (lg > columnsCount) {
      throw Exception(
          "lg is bigger than columnsCount = ${lg}  > ${columnsCount}");
    } else if (md > columnsCount) {
      throw Exception(
          "md is bigger than columnsCount = ${md}  > ${columnsCount}");
    } else if (sm > columnsCount) {
      throw Exception(
          "sm is bigger than columnsCount = ${sm}  > ${columnsCount}");
    } else if (xs > columnsCount) {
      throw Exception(
          "xs is bigger than columnsCount = ${xs}  > ${columnsCount}");
    }

    //use the OrientationBuilder Widget
    //for change the size width, depends of the orientation
    print(orientation);
    final offset = _calcOffset(size, orientation, columnsCount);

    final child = SizedBox(
      width: _calcWidth(size, orientation, columnsCount),
      child: this.child,
    );
    print(offset);
    if (offset > 0.0) {
      print(offset);
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

  double _calcWidth(Size size, Orientation orientation, columnsCount) {

    final width = size.width;
    if (orientation == Orientation.portrait) {

      print("width = ${width}");
      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        // print("lg");
        return colWidth * lg;
      } else if (width >= 992) {
        //print("md");
        return colWidth * md;
      } else if (width >= 768) {
        //print("sm");
        return colWidth * sm;
      } else {
        //print("xs");
        return colWidth * xs;
      }
    } else {
      //Landscape configuration

      print("Height = ${width}");
      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        // print("lg");
        return colWidth * lgLand;
      } else if (width >= 992) {
        //print("md");
        return colWidth * mdLand;
      } else if (width >= 768) {
        //print("sm");
        return colWidth * smLand;
      } else {
        //print("xs");
        return colWidth * xsLand;
      }
    }
  }

  double _calcOffset(Size size, Orientation orientation, columnsCount) {
    if (orientation == Orientation.portrait) {
      print("portrait");
      final width = size.width;

      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        // print("lg");
        return colWidth * lgOffset;
      } else if (width >= 992) {
        //print("md");
        return colWidth * mdOffsset;
      } else if (width >= 768) {
        //print("sm");
        return colWidth * smOffset;
      } else {
        //print("xs");
        return colWidth * xsOffset;
      }
    } else {
      print("landscape");
      //Lanscape configuration
      final width = size.height;
      final colWidth = width / columnsCount;
      if (colWidth > 1170) {
        // print("lg");
        return colWidth * lgLandOffset;
      } else if (width >= 992) {
        //print("md");
        return colWidth * mdLandOffset;
      } else if (width >= 768) {
        //print("sm");
        return colWidth * smLandOffset;
      } else {
        //print("xs");
        return colWidth * xsLandOffset;
      }
    }
  }
}
