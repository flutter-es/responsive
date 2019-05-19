import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class ResponsiveGridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid View'),
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        itemCount: 30,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            child: new Image.network(
              'https://picsum.photos/id/$index/200/200',
              fit: BoxFit.fill,
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.calcColumns(
            size: MediaQuery.of(context).size,
            orientation: MediaQuery.of(context).orientation,
            columns: Columns(
              xs: 2,
              sm: 4,
              md: 4,
              lg: 6,
              xxl: 8,
            ),
          ),
        ),
      ),
    );
  }
}
