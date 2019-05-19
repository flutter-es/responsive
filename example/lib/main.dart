import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

import 'flexibe_row_demo.dart';
import 'responsive_galery.dart';
import 'responsive_gridview.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/flexiwidget': (BuildContext context) => FlexibleRowDemo(),
        '/gallery': (BuildContext context) => ResponsiveGallery(),
        '/gridview': (BuildContext context) => ResponsiveGridview(),
      },
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Demo App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/flexiwidget');
              },
              child: Text('Flexi Widget Demo'),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/gallery');
              },
              child: Text('Image Galery Demo'),
            ),
            RaisedButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/gridview');
              },
              child: Text('GridView Demo'),
            ),
          ],
        ),
      ),
    );
  }
}
