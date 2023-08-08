// views/route_planner_screen.dart
import 'package:codinground/view_models/route_planner_view_model.dart';
import 'package:codinground/widgets/route_map.dart';
import 'package:codinground/widgets/visit_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RoutePlannerScreen extends StatefulWidget {
  @override
  _RoutePlannerScreenState createState() => _RoutePlannerScreenState();
}

class _RoutePlannerScreenState extends State<RoutePlannerScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RoutePlannerViewModel>(
      create: (context) => RoutePlannerViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Route Planner'),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            VisitList(),
            RouteMap(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
          ],
        ),
      ),
    );
  }
}
