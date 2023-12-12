import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MultiThemeStylingGoogleMap extends StatefulWidget {
  const MultiThemeStylingGoogleMap({super.key});
  @override
  State<MultiThemeStylingGoogleMap> createState() => _MultiThemeStylingGoogleMapState();
}
class _MultiThemeStylingGoogleMapState extends State<MultiThemeStylingGoogleMap> {
  // String _mapTheme='';
 final Completer<GoogleMapController>  _controller=Completer();
  static   const CameraPosition _initalPosition=CameraPosition(target: LatLng(21.443711270717383, 91.97579454751398), zoom: 13);

 // @override
 //  void initState() {
 //    // TODO: implement initState
 //    super.initState();
 //    DefaultAssetBundle.of(context).loadString("assets/dark.json").then((value){
 //      _mapTheme=value;
 //    });
 //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Maps Theme"),
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.drag_indicator_outlined,),
          iconColor: Colors.red,
          itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () {

_controller.future.then((value) {

   DefaultAssetBundle.of(context).loadString("assets/silver.json").then((string){
     value.setMapStyle(string);
   });

});
},
              child: Text("Silver Theme")),
          PopupMenuItem(
              onTap: () {
                _controller.future.then((value) {

                  DefaultAssetBundle.of(context).loadString("assets/dark.json").then((string){
                    value.setMapStyle(string);
                  });

                });
              },
              child: Text("Dark Theme")),
          PopupMenuItem(
              onTap: () {
                _controller.future.then((value) {

                  DefaultAssetBundle.of(context).loadString("assets/retro.json").then((string){
                    value.setMapStyle(string);
                  });

                });
              },
              child: Text("Retro Theme")),
          PopupMenuItem(
              onTap: () {
                _controller.future.then((value) {

                  DefaultAssetBundle.of(context).loadString("assets/night.json").then((string){
                    value.setMapStyle(string);
                  });

                });
              },
              child: Text("Night Theme")),
            PopupMenuItem(
                onTap: () {
                  _controller.future.then((value) {

                    DefaultAssetBundle.of(context).loadString("assets/aubergine.json").then((string){
                      value.setMapStyle(string);
                    });

                  });
                },
                child: Text("Aubergine Theme")),
        ],)

      ],
      ),
body: GoogleMap(initialCameraPosition: _initalPosition,
  myLocationEnabled: true,
  myLocationButtonEnabled: true,

  onMapCreated: (GoogleMapController controller) {
  // controller.setMapStyle(_mapTheme);
    _controller.complete(controller);
  },
),
    );
  }
}
