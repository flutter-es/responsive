
# responsive

Allow to easily build a responsive Flutter UI, make for Marvin Quevedo, for FlutterEs Community


## Easy to use

```dart
import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/flex_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Responsive Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: <Widget>[
              ResponsiveRow(
                columnsCount: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  FlexWidget(
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                    ),
                    xs: 4,
                    xsOffset: 2,
                    sm: 3,
                    md: 2,
                    lg: 1,
                    xsLand: 4,
                    xsLandOffset: 0,
                    smLand: 2,
                    mdLand: 1,
                    lgLand: 1,
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
        ));
  }
}

```