import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GetUserCurrentLocation extends StatefulWidget {
  const GetUserCurrentLocation({super.key});

  @override
  State<GetUserCurrentLocation> createState() => _GetUserCurrentLocationState();
}

class _GetUserCurrentLocationState extends State<GetUserCurrentLocation> {
  final Completer<GoogleMapController>  _controller=Completer();
  static   const CameraPosition _kGOOGLEpLEX=CameraPosition(target: LatLng(21.441093398245584, 91.9838749775695), zoom: 14);

  final List<Marker> _marker= <Marker>[
    Marker(markerId: MarkerId("1"),position: LatLng(21.441093398245584, 91.9838749775695),
        infoWindow: InfoWindow( title: "THE TITTLE 0F THE MARKER")),

  ];

Future<Position> getUserCurrentLocation()async{
 await Geolocator.requestPermission().then((value) {

 },).onError((error, stackTrace) {
   print("fahad error :$error");
 });
 return await Geolocator.getCurrentPosition();
}
loadData(){
  getUserCurrentLocation().then((value) async{
    print("my current location");
    print("Latitude ="+value.latitude.toString()+" Longitude ="+value.longitude.toString());

    _marker.add(
      Marker(markerId: MarkerId("2"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow( title: " My current window")),
    );
    CameraPosition _cameraPosition=CameraPosition(target: LatLng(value.latitude, value.longitude),zoom: 14);

    final GoogleMapController _googleMapController=await _controller.future;

    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    setState(() {

    });
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get User Current Location")),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(onPressed: () async{
          loadData();
        },child: Icon(Icons.local_activity)),
      ),
      body:     SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGOOGLEpLEX,
          mapType: MapType.hybrid,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
