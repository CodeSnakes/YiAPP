import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappforstud/pages/Home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//  what is MateialAPP
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Flutter Bank Demo',
      home: HomeView(),
    );
  }
}
