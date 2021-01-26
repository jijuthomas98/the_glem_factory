import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart' as geoC;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/auth.dart';

class UserInputLocation extends StatefulWidget {
  @override
  _UserInputLocationState createState() => _UserInputLocationState();
}

class _UserInputLocationState extends State<UserInputLocation> {
  // List<Marker> allMarkers = [];
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
    // markers.add(Marker(
    //     markerId: MarkerId('My Home address!'),
    //     draggable: true,
    //     onTap: () {
    //       print('Marker placed');
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,
            onTap: (tapped) {
              var cord = geoC.Coordinates(tapped.longitude, tapped.latitude);
              var _address =
                  geoC.Geocoder.local.findAddressesFromCoordinates(cord);
              getMarkers(tapped.latitude, tapped.longitude);
              address = _address;
            },
            compassEnabled: true,
            initialCameraPosition:
                CameraPosition(target: LatLng(23.1815, 79.9864), zoom: 15.0),
            markers: Set<Marker>.of(markers.values),
            onMapCreated: mapCreated,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
            onPressed: () async {
              addCoordinatedToFirebase(
                  lat: position.latitude,
                  long: position.longitude,
                  tapAddress: address);
            },
            icon: Icon(Icons.upload_sharp),
            backgroundColor: Colors.green,
            label: Text('UPLOAD COORDINATES'),
          ),
        ),
        Text('Address : $address'),
        Text('latitude : ${position.latitude}'),
        Text('longitude : ${position.longitude}'),
      ],
    );
  }

  void addCoordinatedToFirebase(
      {@required var lat, @required var long, var tapAddress}) async {
    await FirebaseFirestore.instance.collection('Location').doc().set({
      'latitude': lat,
      'longitude': long,
      'tappedAddress': tapAddress,
      'current_userID': Provider.of<Auth>(context, listen: false).currentUser(),
    });
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
