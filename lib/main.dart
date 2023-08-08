import 'package:codinground/views/route_planner_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Planner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RoutePlannerScreen(),
    );
  }
}
