// widgets/route_map.dart
import 'package:codinground/view_models/route_planner_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';


class RouteMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RoutePlannerViewModel>(context);
    final selectedVisits = viewModel.selectedVisits;

    return FlutterMap(
      options: MapOptions(
        center: LatLng(0.0, 0.0), // Change this to set initial center coordinates.
        zoom: 10.0, // Set initial zoom level.
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: selectedVisits.map((visit) {
            return Marker(
              point: visit.latitudeLongitude, // Use the latitudeLongitude property from Visit model
              builder: (context) => IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  // Implement a method to show visit details when the marker is tapped.
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
