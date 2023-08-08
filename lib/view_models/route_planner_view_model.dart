// view_models/route_planner_view_model.dart
import 'package:codinground/models/visit.dart';
import 'package:flutter/material.dart';

class RoutePlannerViewModel extends ChangeNotifier {
  List<Visit> _selectedVisits = [];
  List<Visit> get selectedVisits => _selectedVisits;

  void addVisit(Visit visit) {
    _selectedVisits.add(visit);
    notifyListeners();
  }

  void deleteVisit(int index) {
    _selectedVisits.removeAt(index);
    notifyListeners();
  }

  void swapVisits(int index1, int index2) {
    final temp = _selectedVisits[index1];
    _selectedVisits[index1] = _selectedVisits[index2];
    _selectedVisits[index2] = temp;
    notifyListeners();
  }
}
