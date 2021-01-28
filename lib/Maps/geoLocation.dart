import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart' as geoC;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/auth.dart';
import 'package:the_glem_factory/screens/HomePage.dart';


class UserInputLocation extends StatefulWidget {
  @override
  _UserInputLocationState createState() => _UserInputLocationState();
}

class _UserInputLocationState extends State<UserInputLocation> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(snippet: 'Home Address!!'));
    setState(() {
      markers.clear();
      markers[markerId] = _marker;
    });
  }

  var address;
  GoogleMapController _controller;
  Position position;

  void getCurrentPosition() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
          child: Icon(
            FontAwesomeIcons.backward,
            size: 22,
          ),
        ),
        title: Text(' Pin location '),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              onTap: (tapped) async {
                var docName = Provider.of<Auth>(context, listen: false).currentUser();
                var cord = geoC.Coordinates(tapped.longitude, tapped.latitude);
                var address = await
                    geoC.Geocoder.local.findAddressesFromCoordinates(cord);
                var firstAddress = address.first;
                getMarkers(tapped.latitude, tapped.longitude);
                print(tapped.latitude);
                print(tapped.longitude);
                print(firstAddress.addressLine);
                FirebaseFirestore.instance.collection('Location').doc(docName).set({
                  'latitude': tapped.latitude,
                  'longitude' : tapped.longitude,
                  'Uid' : docName,
                  'TappedAddress' : firstAddress.addressLine,
                });
              },
              compassEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(23.1511, 79.9486), zoom: 15.0),
              markers: Set<Marker>.of(markers.values),
              onMapCreated: mapCreated,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title :  Text('PIN LOCATION'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Use this map to pin your home'),
                            Text('This pinned location will be used to provide home services.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Okay'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.info_outline),
              backgroundColor: Colors.green,
              label: Text(' Info ? '),
            ),
          ),
          Align(
            alignment : Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text('Address :  $address'),
                  // Text('latitude : $lati'),
                  // Text('longitude : $long'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void mapCreated(GoogleMapController controller) {
    setState(() {
      controller = _controller;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
