import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GoogleMapMarkerCustominformation extends StatefulWidget {
  const GoogleMapMarkerCustominformation({super.key});

  @override
  State<GoogleMapMarkerCustominformation> createState() => _GoogleMapMarkerCustominformationState();
}

class _GoogleMapMarkerCustominformationState extends State<GoogleMapMarkerCustominformation> {
  CustomInfoWindowController _customInfoWindowController=CustomInfoWindowController();
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

 loadData()async{
  for(int i=0;i<_latlang.length;i++){
 if(i%2 == 0){
   _marker.add(Marker(markerId: MarkerId(i.toString()),
     icon: BitmapDescriptor.defaultMarker,
     position: _latlang[i],
     onTap: () {
       _customInfoWindowController.addInfoWindow ! (
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 180,
               width: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: Colors.white
               ),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Container(
                       height: 110,
                       width: double.infinity,
                       decoration: const BoxDecoration(
                           image: DecorationImage(image: AssetImage("images/jorna.jpg"),
                               fit: BoxFit.fitWidth,
                               filterQuality: FilterQuality.high
                           ),
                           borderRadius: BorderRadius.only(
                             bottomLeft: Radius.circular(20),
                             bottomRight: Radius.circular(20),
                             topRight: Radius.circular(10),
                             topLeft: Radius.circular(10),

                           )
                       ),
                     ),
                     ListTile(
                       isThreeLine: true,
                       leading: Icon(Icons.directions),
                       title: Text("Water Fall",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                       subtitle: Text("Water Fall is exicting place, nesr bye cox's baza" ),
                       trailing: Text("1 days",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black)),

                     ),
                   ],
                 ),
               ),
             ),
           ),
           _latlang[i]

       );
     },
   ));
 }else{
   _marker.add(Marker(markerId: MarkerId(i.toString()),
     icon: BitmapDescriptor.defaultMarker,
     position: _latlang[i],
     onTap: () {
       _customInfoWindowController.addInfoWindow ! (
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 180,
               width: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: Colors.white
               ),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Container(
                       height: 110,
                       width: double.infinity,
                       decoration: const BoxDecoration(
                           image: DecorationImage(image: AssetImage("images/mountai.jpg"),
                               fit: BoxFit.fitWidth,
                               filterQuality: FilterQuality.high
                           ),
                           borderRadius: BorderRadius.only(
                             bottomLeft: Radius.circular(20),
                             bottomRight: Radius.circular(20),
                             topRight: Radius.circular(10),
                             topLeft: Radius.circular(10),

                           )
                       ),
                     ),
                     ListTile(
                       isThreeLine: true,
                       leading: Icon(Icons.mobile_friendly_outlined),
                       title: Text("Avarest",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                       subtitle: Text("AvarestAvarestAvarestAvarestAvarestAvarest" ),
                       trailing: Text("3 days",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black)),

                     ),
                   ],
                 ),
               ),
             ),
           ),
           _latlang[i]

       );
     },
   ));
 }
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
      backgroundColor: Colors.red,
      appBar: AppBar(title: Text("Google Map Marker Custom Info window")),
body: Stack(
  children: [
    GoogleMap(initialCameraPosition: const CameraPosition(target: LatLng(21.425348596466957, 92.01221723899988),zoom: 14),
      mapType: MapType.hybrid,
      markers: Set<Marker>.of(_marker),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onTap: (position) {
  _customInfoWindowController.hideInfoWindow ! ();
      },
      onCameraMove: (position) {
      _customInfoWindowController.onCameraMove!();
      },
onMapCreated: (GoogleMapController controller) {
  _customInfoWindowController.googleMapController=controller;
},
    ),
CustomInfoWindow(controller: _customInfoWindowController,
height: 200,
  width: 300,
  offset: 35,
),

  ],
),
    );
  }
}
