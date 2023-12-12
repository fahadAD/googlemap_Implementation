import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class DrawPolygonOnGoogleMap extends StatefulWidget {
  const DrawPolygonOnGoogleMap({super.key});

  @override
  State<DrawPolygonOnGoogleMap> createState() => _DrawPolygonOnGoogleMapState();
}
class _DrawPolygonOnGoogleMapState extends State<DrawPolygonOnGoogleMap> {
  Completer<GoogleMapController>  _controller=Completer();
  static   const CameraPosition _initalPosition=CameraPosition(target: LatLng(21.443711270717383, 91.97579454751398), zoom: 14.4746);

 final Set<Marker> _marker= {};
 Set<Polygon> _Polygon=HashSet<Polygon>();
  final List<LatLng> _latlang_points= <LatLng>[
    LatLng(21.445201083164537, 91.97285819109057),
    LatLng(21.452271037809023, 91.98940205635407),
    LatLng(21.440128079697637, 91.99822115960292),
    LatLng(21.441186634304927, 91.98253560124652),
    LatLng(21.432857798731884, 91.98221373616259),
    LatLng(21.445201083164537, 91.97285819109057),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Polygon.add(
      Polygon(polygonId: PolygonId("1"),points: _latlang_points,
      fillColor: Colors.red.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 2,
        strokeColor: Colors.red
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Polygon to Google Map"),),
        body: GoogleMap(initialCameraPosition: _initalPosition,
          polygons: _Polygon,
          myLocationButtonEnabled: true,
          myLocationEnabled: false,
           onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
