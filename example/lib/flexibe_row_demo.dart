import 'package:flutter/material.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/responsive_row.dart';

class FlexibleRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Flex Widget'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ResponsiveRow(
            columnsCount: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              FlexWidget(
                builder: ((BuildContext context, double width, double offset,
                    ScreenSize screenSize) {
                  return Container(
                    color: Colors.green,
                    width: width,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ResponsiveRow(
                          children: <Widget>[
                            FlexWidget(
                              xs: 6,
                              child: Container(
                                color: Colors.black,
                                height: 100,
                              ),
                            ),
                            FlexWidget(
                              xs: 6,
                              builder: (BuildContext context, double width,
                                  double offset, ScreenSize screenSize) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    width.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: Colors.blue,
                                  width: width,
                                  height: 100,
                                );
                              },
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            width.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                xs: 12,
                md: 12,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.red,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.indigo,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.lime,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.teal,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.green,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.deepOrange,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.amber,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.grey,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.black,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.brown,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
              FlexWidget(
                child: Container(
                  height: 100,
                  color: Colors.cyan,
                ),
                xs: 6,
                sm: 3,
                md: 2,
                lg: 1,
                xsLand: 4,
                smLand: 2,
                mdLand: 1,
                lgLand: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
