import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/flex_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: <Widget>[
              ResponsiveRow(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.amber,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.red,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.indigo,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.lime,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.teal,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.green,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.deepOrange,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.amber,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.grey,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.black,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.brown,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                  FlexWidget(
                    Container(
                      height: 100,
                      color: Colors.cyan,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
