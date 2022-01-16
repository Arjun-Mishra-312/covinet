import 'dart:html' hide Point;
import 'package:google_maps/google_maps.dart';
import 'package:flutter/material.dart' hide Icon;

import 'dart:ui' as ui;

class GetTestingLocations extends StatefulWidget {
  const GetTestingLocations({Key? key}) : super(key: key);

  @override
  State<GetTestingLocations> createState() => _GetTestingLocationsState();
}

class _GetTestingLocationsState extends State<GetTestingLocations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          TestingMap(),
        ],
      ),
    );
  }
}

List<List<double>> locations = [
  [37.000956610797054, -122.0575087059558],
  [36.9753158712058, -122.02377724363483],
  [36.96276658470581, -122.04446244097345],
  [36.96985193153581, -122.03821084412057],
  [36.980488666503796, -122.01925557503225],
  [36.963875988824526, -122.03725469700049],
];

class TestingMap extends StatelessWidget {
  const TestingMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String htmlId = "8";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(36.974129, -122.033745);
      final mapOptions = MapOptions()
        ..zoom = 12
        ..center = myLatlng;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final newMap = GMap(elem, mapOptions);
      void addMarker(LatLng location) {
        Marker(MarkerOptions()
          ..position = location
          ..map = newMap);
      }

      for (List<double> coords in locations) {
        addMarker(LatLng(coords[0], coords[1]));
      }

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
