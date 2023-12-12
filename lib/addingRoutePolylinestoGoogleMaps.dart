import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddingRoutePolylinestoGoogleMaps extends StatefulWidget {
  const AddingRoutePolylinestoGoogleMaps({super.key});

  @override
  State<AddingRoutePolylinestoGoogleMaps> createState() => _AddingRoutePolylinestoGoogleMapsState();
}

class _AddingRoutePolylinestoGoogleMapsState extends State<AddingRoutePolylinestoGoogleMaps> {
  Completer<GoogleMapController>  _controller=Completer();
  static   const CameraPosition _initalPosition=CameraPosition(target: LatLng(21.443711270717383, 91.97579454751398), zoom: 14.4746);
  final Set<Marker> _marker= {};
final  Set<Polyline> _Polylines ={};

  final List<LatLng> _latlang_points= <LatLng>[
    LatLng(21.445201083164537, 91.97285819109057),
    LatLng(21.452271037809023, 91.98940205635407),
    LatLng(21.440128079697637, 91.99822115960292),
    LatLng(21.441186634304927, 91.98253560124652),
    LatLng(21.432857798731884, 91.98221373616259),
    // LatLng(21.445201083164537, 91.97285819109057),
  ];
  loadData(){
    for(int i=0;i<_latlang_points.length;i++){
   if(i%2==0){
     _marker.add(Marker(markerId: MarkerId(i.toString()),
         position: _latlang_points[i],
         infoWindow: InfoWindow(title: "Really Cool Destination",snippet: " 2 Star Rating"),
         icon: BitmapDescriptor.defaultMarker
     ));
   }else{
     _marker.add(Marker(markerId: MarkerId(i.toString()),
         position: _latlang_points[i],
         infoWindow: InfoWindow(title: "Really Cool Place",snippet: " 4 Star Rating"),
         icon: BitmapDescriptor.defaultMarker
     ));
   }
      setState(() {

      });
    }
    _Polylines.add(Polyline(polylineId: PolylineId("1"),
      points: _latlang_points,
      color: Colors.teal,width: 2,
    ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Polylines to GoogleMaps"),),
      body: GoogleMap(initialCameraPosition: _initalPosition,
        mapType: MapType.terrain,
        markers: _marker,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        polylines: _Polylines,
        onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
        },

      ),
      ),
    );
  }
}
