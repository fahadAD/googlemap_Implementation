import 'package:flutter/material.dart';
import 'package:google_map_implementation/search_places_api_screen.dart';
import 'package:google_map_implementation/shownetwork%20imageasmarkeronmap.dart';
import 'package:google_map_implementation/themeStylingGoogleMap.dart';

import 'addMultipleCustomMarker.dart';
import 'addingRoutePolylinestoGoogleMaps.dart';
import 'convert_latlong_to_address.dart';
import 'drawPolygonOnGoogleMap.dart';
import 'get_user_current_location.dart';
import 'googleMapMarkerCustomInfowindow.dart';
import 'normal_maps.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NormalMaps(),));
              }, child: Text("Integrate simple Google Map")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConvertLatLongToAddress(),));
              }, child: Text("Get user current location and show it on map")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GetUserCurrentLocation(),));
              }, child: Text("Get User Current Location")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPlacesApiScreen(),));
              }, child: Text("Search Places Api Screen")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddMultipleCustomImageMarker(),));
              }, child: Text("Add Multiple Custom Marker")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapMarkerCustominformation(),));
              }, child: Text("Google Map Marker Custom Information")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DrawPolygonOnGoogleMap(),));
              }, child: Text("Draw Polygon OnGoogle Map")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddingRoutePolylinestoGoogleMaps(),));
              }, child: Text("Adding Route Polylines to GoogleMaps")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShowNetworkImageasMarkerOnMap(),));
              }, child: Text("Show Network Image as Marker OnMap")),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MultiThemeStylingGoogleMap(),));
              }, child: Text("Multi Theme Styling GoogleMap")),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
