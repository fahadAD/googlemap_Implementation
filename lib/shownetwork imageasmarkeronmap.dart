import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:ui';
class ShowNetworkImageasMarkerOnMap extends StatefulWidget {
  const ShowNetworkImageasMarkerOnMap({super.key});
  @override
  State<ShowNetworkImageasMarkerOnMap> createState() => _ShowNetworkImageasMarkerOnMapState();
}
class _ShowNetworkImageasMarkerOnMapState extends State<ShowNetworkImageasMarkerOnMap> {
  Completer<GoogleMapController>  _controller=Completer();
  static   const CameraPosition _initalPosition=CameraPosition(target: LatLng(21.443711270717383, 91.97579454751398), zoom: 14.4746);

  final List<Marker> _marker= <Marker>[];

  final List<LatLng> _latlang_points= <LatLng>[
    LatLng(21.445201083164537, 91.97285819109057),
    LatLng(21.452271037809023, 91.98940205635407),
    LatLng(21.440128079697637, 91.99822115960292),
    LatLng(21.441186634304927, 91.98253560124652),
    LatLng(21.432857798731884, 91.98221373616259),
  ];

Future<Uint8List?>  loadNetworkImage({required String path})async{
final completer=Completer<ImageInfo>();
var image=NetworkImage(path);
image.resolve(ImageConfiguration()).addListener(ImageStreamListener((info, synchronousCall) =>completer.complete(info) ,));
final imageInfo=await completer.future;
final byteData=await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
return byteData?.buffer.asUint8List();
}

  loadData() async {
    for(int i=0;i<_latlang_points.length;i++){

      Uint8List?  image=await loadNetworkImage(path: "https://cdn-icons-png.flaticon.com/512/3135/3135715.png");
      final ui.Codec markerImageCodec=await ui.instantiateImageCodec(image!.buffer.asUint8List(), targetWidth: 100, targetHeight: 100,);
      final ui.FrameInfo _FrameInfo=await  markerImageCodec.getNextFrame();
      final ByteData? byteData=await _FrameInfo.image.toByteData(format: ui.ImageByteFormat.png,);
      final Uint8List resizeImageMaker=byteData!.buffer.asUint8List();
      _marker.add(Marker(markerId: MarkerId(i.toString(),),
        position: _latlang_points[i],
        infoWindow: InfoWindow(title: "Serial no "+i.toString()),
        icon: BitmapDescriptor.fromBytes(resizeImageMaker),
      ));

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Show Network Image as Marker OnMap")),
        body: GoogleMap(initialCameraPosition: _initalPosition,
        mapType: MapType.hybrid,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_marker),

          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },

        ),
      ),
    );
  }
}
