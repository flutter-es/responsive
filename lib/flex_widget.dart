import 'package:flutter/widgets.dart';

import 'responsive.dart';

class FlexWidget extends StatelessWidget {
  final Widget child;
  //Columns counts for less than 768
  final int xs;
  //Columns counts for more or equals to 768
  final int sm;
  //Columns counts for more or equals to 992
  final int md;
  //Columns counts for more or equals to 1170
  final int lg;

  FlexWidget(
      {this.child, this.xs = 12, this.sm = 10, this.md = 8, this.lg = 6});

  @override
  Widget build(BuildContext context) {
    //obtain the screen size
    final size = MediaQuery.of(context).size;
    final columnsCount = ResponsiveSettings.of(context).columnsCount;

    if(lg > columnsCount){
      throw Exception("lg is bigger than columnsCount = ${lg}  > ${columnsCount}");
    }
    else if(md > columnsCount){
      throw Exception("md is bigger than columnsCount = ${md}  > ${columnsCount}");
    }else if(sm > columnsCount){
      throw Exception("sm is bigger than columnsCount = ${sm}  > ${columnsCount}");
    }else if(xs > columnsCount){
      throw Exception("xs is bigger than columnsCount = ${xs}  > ${columnsCount}");
    }

    //use the OrientationBuilder Widget
    //for change the size width, depends of the orientation
    return OrientationBuilder(
      builder: (context, orientation) {
        return SizedBox(
          width: _calcWidth(size, orientation, columnsCount),
          child: this.child,
        );
      },
    );
  }

  double _calcWidth(Size size, Orientation orientation, columnsCount) {
    final width =
        orientation == Orientation.portrait ? size.width : size.height;
   // print(width);
    //print(orientation);
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
  }
}
