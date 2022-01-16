import 'dart:html' hide Point;
import 'package:google_maps/google_maps.dart';
import 'package:google_maps/google_maps_places.dart';
import 'package:flutter/material.dart' hide Icon;

import 'dart:ui' as ui;

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key, required this.setLoc}) : super(key: key);
  final Function setLoc;

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
          GoogleMap(setLoc: widget.setLoc),
        ],
      ),
    );
  }
}

late GMap map;
final markers = <Marker>[];

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key, required this.setLoc}) : super(key: key);
  final Function setLoc;
  @override
  Widget build(BuildContext context) {
    String htmlId = "7";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(36.974129, -122.033745);
      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = myLatlng
        ..mapTypeId = 'roadmap';

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

      // Create the search box and link it to the UI element.
      final input = document.createElement('input',
              'id="pac-input" class="controls" type="text" placeholder="Search Box"')
          as InputElement;
      map.controls![ControlPosition.TOP_LEFT as int]!.push(input);

      final searchBox = SearchBox(input);

      // Listen for the event fired when the user selects an item from the
      // pick list. Retrieve the matching places for that item.
      searchBox.onPlacesChanged.listen((_) {
        final places = searchBox.places!;

        if (places.isEmpty) {
          return;
        }
        for (final marker in markers) {
          marker.map = null;
        }

        // For each place, get the icon, place name, and location.
        markers.clear();
        final bounds = LatLngBounds();
        for (final place in places) {
          final image = Icon()
            ..url = place!.icon
            ..size = Size(71, 71)
            ..origin = Point(0, 0)
            ..anchor = Point(17, 34)
            ..scaledSize = Size(25, 25);

          // Create a marker for each place.
          final marker = Marker(MarkerOptions()
            ..map = map
            ..title = place.name
            ..position = place.geometry!.location);

          if (place.geometry?.location != null) {
            LatLng location = LatLng(
                place.geometry!.location?.lat, place.geometry!.location?.lng);
            addMarker(location);
            markers.add(marker);
          }

          bounds.extend(place.geometry!.location);
        }

        map.fitBounds(bounds);
      });

      // Bias the SearchBox results towards places that are within the bounds of the
      // current map's viewport.
      map.onBoundsChanged.listen((_) {
        final bounds = map.bounds;
        searchBox.bounds = bounds;
      });

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }

  void addMarker(LatLng location) {
    setLoc([location.lat.toDouble(), location.lng.toDouble()]);
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
