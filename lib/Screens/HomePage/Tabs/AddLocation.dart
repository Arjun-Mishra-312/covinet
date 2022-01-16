import 'dart:html';
import 'package:covinet/Screens/AddLocationForm.dart';
import 'package:google_maps/google_maps.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          GoogleMap(),
        ],
      ),
    );
  }
}

late GMap map;
final markers = <Marker>[];

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String htmlId = "7";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(36.974129, -122.033745);
      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = myLatlng;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      map = GMap(elem, mapOptions);

      // Configure the click listener.
      map.onClick.listen((mapsMouseEvent) {
        // Add Marker event
        deleteMarkers();
        addMarker(mapsMouseEvent.latLng!);
      });
      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  void addMarker(LatLng location) {
    final marker = Marker(MarkerOptions()
      ..position = location
      ..map = map);
    markers.add(marker);
  }

  // Sets the map on all markers in the array.
  void setAllMap(GMap? map) {
    for (final m in markers) {
      m.map = map;
    }
  }

  // Removes the markers from the map, but keeps them in the array.
  void clearMarkers() => setAllMap(null);

  // Shows any markers currently in the array.
  void showMarkers() => setAllMap(map);

  // Deletes all markers in the array by removing references to them.
  void deleteMarkers() {
    clearMarkers();
    markers.clear();
  }
}
