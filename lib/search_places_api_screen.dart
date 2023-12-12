import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
class SearchPlacesApiScreen extends StatefulWidget {
  const SearchPlacesApiScreen({super.key});

  @override
  State<SearchPlacesApiScreen> createState() => _SearchPlacesApiScreenState();
}

class _SearchPlacesApiScreenState extends State<SearchPlacesApiScreen> {
  TextEditingController _Searchcontroller=TextEditingController();
  var uuID=Uuid();
  String sessiontoken="122344";
  List<dynamic> _placelist=[];

  void getSuggestion(String _input)async{
    String kPlaces_Api_Key="AIzaSyBHF3gqI9s2J-8Yy3uaTouzeR6Dykr3idc";
    String baseURL ="https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request = "$baseURL?input=$_input&key=$kPlaces_Api_Key&sessiontoken=$sessiontoken";

    var response=await http.get(Uri.parse(request));
var data=response.body.toString();
print(data);
    print(response.body.toString());
    // print(response.statusCode);

    if(response.statusCode==200){
      setState(() {
        _placelist=jsonDecode(response.body.toString()) ["predictions"];
      });
    }else{
      throw Exception("Failed To Load Data");
    }
  }
  void onChange(){
    if(sessiontoken==null){
  setState(() {
    sessiontoken=uuID.v4();
  });
    }
    getSuggestion(_Searchcontroller.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Searchcontroller.addListener(() {
      onChange();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Places Api Screen")),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
      controller: _Searchcontroller,
              decoration: InputDecoration(
                  labelText: "Search Places",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
            ),
          ),
          SizedBox(height: 10,),
ListView.builder(
  primary: false,
  shrinkWrap: true,
  itemCount: _placelist.length,
  itemBuilder: (BuildContext context, int index) {
 return ListTile(
    onTap: () async {
      List<Location> locations = await locationFromAddress(_placelist[index]["description"]);
print("Fahad longitude=${locations.last.longitude}");
      print("Fahad latitude=${locations.last.latitude}");
    },
   title: Text(_placelist[index]["description"]),

 );
},

)

        ],
      ),
    );
  }
}
