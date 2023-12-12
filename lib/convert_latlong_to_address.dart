import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
class ConvertLatLongToAddress extends StatefulWidget {
  const ConvertLatLongToAddress({super.key});

  @override
  State<ConvertLatLongToAddress> createState() => _ConvertLatLongToAddressState();
}

class _ConvertLatLongToAddressState extends State<ConvertLatLongToAddress> {
String _Address="";
String _Lon_Lan="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conver Lon-Lan To Address"),),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(_Address),
    ),
    SizedBox(height: 20,),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(_Lon_Lan),
    ),



     Center(
       child: ElevatedButton(onPressed: () async {
         List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
         List<Placemark> placemarks = await placemarkFromCoordinates(23.750191773651327, 90.38786651875294);

         setState(() {
           _Lon_Lan="Longitude ="+locations.last.longitude.toString()+"\n Latitude="+locations.last.latitude.toString();
           _Address="CountryCode="+placemarks.reversed.last.isoCountryCode.toString()+"\n postalCode= "+placemarks.reversed.last.postalCode.toString()+"\n subLocality="+placemarks.reversed.last.subLocality.toString()+"\n  locality="+placemarks.reversed.last.locality.toString()+"\n subAdministrativeArea="+placemarks.reversed.last.subAdministrativeArea.toString()+"\n street="+placemarks.reversed.last.street.toString()+"\n country="+placemarks.reversed.last.country.toString();
         });
       }, child: Text(" Convert ")),
     )

  ],
),    );
  }
 }
