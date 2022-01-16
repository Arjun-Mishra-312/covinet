import 'dart:convert';
import 'dart:html';

import 'package:google_maps/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui' as ui;

//code inspired by https://github.com/a14n/dart-google-maps/blob/master/example/05-drawing_on_map/marker-remove/page.dart
final markers = <Marker>[];
late GMap map;

/**
{
  ...
  location: [
    'lat': 234.32424
    'long': 234.2342
  ],
}
*/

//  final static_marker_1 = Marker(MarkerOptions()
//         ..position = myLatlng
//         ..map = map
//         ..title = 'Hello World!'
//         ..label = 'h'
//         ..icon =
//             'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');

/** 
 * schema from database
 *  -name : string
 *  -email : email
 *  pins : List<geolocation>
 *    ref: geolocation 
 * Map<String, dyanmic> 
 * uid : asfljdgldGAJSFKL%5820 
 * jsonB : $ref user schema
 */

// [{name: person1, date,...}, {name: person2, date2: ..}]
// void CreateMarker(List<Map<String, dynamic>> jsonData){
//@TODO parse locations and call addMarker
/**
   * for every JSONB 
   *      for every pin inside user's pins
   *      create Marker
   *      Add Pin 
   * database['campusConnect']['hashTags'].forEach((item) {
    print('I am here ...');
    if (item['id'] == hashtagId) {
     print(item['title']);
    } 
    */

/** 
     *  [0] uid : [name, email, List: [Geocordinates]] 
     *  for(every blob in list) 
     *      key = blob.keys() wouldn't work here <- 
     *      for(var e in blob[key[0]]) 
     *          //add to list
     */
// });
/**
    {
      name: person
      ping[[x1, y1], [x2, y2]]
    }
   */
// entire document
// for(var jsonBlob in jsonData) {
//   coords = jsonBlob['pins'];
//   // specific to the user
//   for (var coord in coords) {
//     var

//   }

// }
//  jsonData.forEach( (ele) => {
//    ele.keys
//   for(var k in ele.pins) {
//     final marker = Marker(MarkerOptions()
//       ..position = myLatlng
//       ..map = map
//       ..title = 'Hello World!'
//       ..label = 'h',
//     );
//   }
// });

//addMarker(LatLng)
// }

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
      child: GoogleMap(),
    );
  }
}

class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(36.974129, -122.033745);

      // another location
      final myLatlng2 = LatLng(36.974129, -122.033745);
      final myLatLng3 = LatLng(37.459244, -122.2345604);
      final myLatLng4 = LatLng(36.4523124, -122.345667);

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(36.974129, -122.033745);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);
      // StreamBuilder(stream: FirebaseFirestore.instance.collection('users').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     if(!snapshot.hasData) {
      //       return Text('loading...');
      //     }
      //     print(snapshot.data.documents[0]['pins'][0]);
      //     return Column(children: <Widget>[
      //       Text('stud return type')
      //     ],
      //     );
      //   }
      // );

      //calling data from firestore
      // StreamBuilder(stream: FirebaseFirestore.instance.collection('users').snapshots(),
      // builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //   if(!snapshot.hasData) {
      //     return Text('loading...');
      //   }
      //   for(const data in snapshot.data.documents) {
      //       for(const i in snapshot.data.documents['pins']) {
      //         var marker = Marker(MarkerOptions()
      //         ..position = new LatLng(snapshot.data.documents['pins'][i].getLatitude(), snapshot.data.documents['pins'][i].getLongitude()))
      //         ..map = map
      //         ..title =  data.documents['name']
      //         ..label = 'pin';

      //       }
      //   }
      // },
      // );
      /** static stuff */
      final static_marker_1 = Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!'
        ..label = 'h'
        ..icon =
            'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');

      final marker = Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!'
        ..label = 'h'
        ..icon =
            'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');
      // Another marker
      Marker(
        MarkerOptions()
          ..position = myLatlng2
          ..map = map,
      );

      final infoWindow =
          InfoWindow(InfoWindowOptions()..content = contentString);
      marker.onClick.listen((event) => infoWindow.open(map, marker));
      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}

void addMarker(LatLng location) {
  final marker = Marker(MarkerOptions()
    ..position = location
    ..map = map);
  markers.add(marker);
}

var contentString = '';
