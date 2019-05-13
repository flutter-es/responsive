import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:responsive/flex_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Responsive Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              ResponsiveRow(
                children: List.generate(100, (index) {
                  return FlexWidget(
                    // Como hijo, usamos una imágen desde internet, será la misma para todas
                    child: Image.network(
                        "https://thispersondoesnotexist.com/image"),
                    // Definimos un ancho de 6 para movil, lo que es lo mismo, dos columnas
                    xs: 6,
                    // Definimos un ancho de 3 para tablets pequeñas, 4 columnas
                    sm: 3,
                    // Definimos 2 para tablets, 6 columnas
                    md: 2,
                    // Definimos 1 para pantallas grandes, 12 columnas
                    lg: 1,
                    // Conficiones para horizontal

                    // Definimos 4 para movil en horizontal, 3 columnas
                    xsLand: 4,
                    // Definimos 2 para tablets pequeñas, 6 columnas
                    smLand: 2,
                    // Definimos 2 para tablets, 6 columnas
                    mdLand: 2,
                    // Definimos 1 para patallas grandes, 12 columnas
                    lgLand: 1,
                  );
                }),
              )
            ],
          ),
        ));
  }
}
