import 'dart:async';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Branches.dart';
import 'dart:convert';

class BranchesPage extends StatefulWidget {
  @override
  _BranchesPageState createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  Set<Marker> _branchesList = {};
  Completer<GoogleMapController> _controller = Completer();
  void onComplete(GoogleMapController controller) {
    _controller.complete();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " نقشه ",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,
//        leading: Icon(
//          Icons.arrow_back,
//          color: Colors.black45,
//        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: GoogleMap(
        markers: _branchesList,
        onMapCreated: onComplete,
        initialCameraPosition: CameraPosition(
          target: LatLng(35.693387, 51.391693),
          zoom: 5,
        ),
      ),
    );
  }
////////////////////////////////////////////////////film 18
  void fetchPoints() async {
    var urll = "http://welearnacademy.ir/flutter/branches.json";
    Response responsee = await get(urll);
    setState(() {
      var pointJson = json.decode(utf8.decode(responsee.bodyBytes));
      for (var i in pointJson) {
        var b = Branches(i['shop_name'], i['id'], i['tel'], i['lat'], i['lng'],
            i['manager']);
        Marker marker = Marker(
            markerId: MarkerId(b.id.toString()),
            position: LatLng(b.lat, b.lng),
            infoWindow: InfoWindow(title: b.shop_name, snippet: b.manager));
        _branchesList.add(marker);
      }
    });
  }
}
