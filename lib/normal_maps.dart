import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class NormalMaps extends StatefulWidget {
  const NormalMaps({super.key});

  @override
  State<NormalMaps> createState() => _NormalMapsState();
}

class _NormalMapsState extends State<NormalMaps> {

       //Random Screen
  final Completer<GoogleMapController>  _controller=Completer();
  static   const CameraPosition _initalPosition=CameraPosition(target: LatLng(23.750191773651327, 90.38786651875294), zoom: 14.4746);
   // Multiple Marker
  List<Marker> _marker=[];
final List<Marker> _list=  [
const Marker(markerId: MarkerId("1"),position: LatLng(23.750191773651327, 90.38786651875294),
    infoWindow: InfoWindow( title: "MY Current Location")),
  const Marker(markerId: MarkerId("1"),position: LatLng(23.74828716557283, 90.38824271154584),
      infoWindow: InfoWindow( title: "MY Second Location")),
  const Marker(markerId: MarkerId("1"),position: LatLng(21.4416724575921, 91.98380369938927),
      infoWindow: InfoWindow( title: "MY Parmanent Location")),
  const Marker(markerId: MarkerId("1"),position: LatLng(21.441093398245584, 91.9838749775695),
      infoWindow: InfoWindow( title: "MY Parmanent Location")),
  const Marker(markerId: MarkerId("1"),position: LatLng(33.6941, 72.9734),
      infoWindow: InfoWindow( title: "MY Unkonown Location")),
 ];


@override
  void initState() {
    // TODO: implement initState
    super.initState();
_marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google map")),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(onPressed: () async {
          setState(() async {
            GoogleMapController controller=await _controller.future;
            controller .animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(21.441093398245584, 91.9838749775695,),zoom: 14,),
            ));
          });
        }, child: Icon(Icons.location_disabled)),
      ),
      body:     SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initalPosition,
          mapType: MapType.hybrid,
 markers: Set<Marker>.of(_marker),
 compassEnabled: true,
 webGestureHandling: WebGestureHandling.greedy,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),

    );
  }
}
