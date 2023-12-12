import 'dart:async';
import 'dart:typed_data';import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddMultipleCustomImageMarker extends StatefulWidget {
  const AddMultipleCustomImageMarker({super.key});

  @override
  State<AddMultipleCustomImageMarker> createState() => _AddMultipleCustomImageMarkerState();
}

class _AddMultipleCustomImageMarkerState extends State<AddMultipleCustomImageMarker> {

  final Completer<GoogleMapController>  _controller=Completer();
  Uint8List? markerImage;
  final List<String> _images=[
    "images/bike.png", "images/car.png", "images/cycle.png", "images/pickup.png", "images/store.png","images/car.png","images/man.png","images/pre.png",
  ];
  final List<Marker> _marker=  <Marker>[];

  final List<LatLng> _latlang= <LatLng>[
    LatLng(21.425348596466957, 92.01221723899988),
    LatLng(21.429322175817088, 92.0024927019168),
    LatLng(21.4289537690354, 92.00865534460318),
    LatLng(21.423690713507664, 91.99649967324932),
    LatLng(21.4249801796583, 92.02013255988146),
    LatLng(21.427485215003827, 92.02477207077716),
    LatLng(21.41612108274943, 91.98440611585023),
    LatLng(21.428381889321088, 91.97742364947162),
  ];

  static   const CameraPosition _initalPosition=CameraPosition(target: LatLng(21.441093398245584, 91.9838749775695), zoom: 14);


  Future<Uint8List> getfromiconAsset(String path,int width)async{
    ByteData _data=await rootBundle.load(path);
    ui.Codec codec=await ui.instantiateImageCodec(_data.buffer.asUint8List(),targetWidth: width);
    ui.FrameInfo fI=await  codec.getNextFrame();
    return (await fI.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }


  loadData()async{
 for(int i=0;i<_images.length;i++){
  final Uint8List _markerIcon=await getfromiconAsset(_images[i], 78);
_marker.add(
  Marker(markerId: MarkerId(i.toString()),
  position: _latlang[i],
    icon: BitmapDescriptor.fromBytes(_markerIcon),
    infoWindow: InfoWindow(title: "This is Tittle Marker : "+i.toString()),

  ),
);
setState(() {

});
 }
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
      appBar: AppBar(title: Text("Add Multiple Custom Marker")),
      body: SafeArea(child: GoogleMap(
          initialCameraPosition: _initalPosition,
        mapType: MapType.terrain,
       // myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: Set<Marker>.of(_marker),

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )),
    );
  }
}
