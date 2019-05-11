
# responsive

[![build status](https://img.shields.io/travis/flutterchina/responsive/vm.svg?style=flat-square)](https://travis-ci.org/flutterchina/dio)
[![Pub](https://img.shields.io/pub/v/responsive.svg?style=flat-square)](https://pub.dartlang.org/packages/responsive)
[![support](https://img.shields.io/badge/platform-flutter%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/flutter-es/responsive)

Allow to make responsive UI with Flutter easily, make for Marvin Quevedo, for FlutterEs Community

### Add dependency

```yaml
dependencies:
  responsive: 0.0.1  #latest version
```

## Super simple to use

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
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  FlexWidget(
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                    ),
                    xs: 6,
                    sm: 3,
                    md: 2,
                    lg: 1,
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
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

```