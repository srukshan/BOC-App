import 'package:boc_app/view/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FindUs();
  }
}

class _FindUs extends State<FindUs> {
  GoogleMapController mapController;

  double _zoom = 2;

  LatLng _position = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> getLocation(context) async {
    var status = await Geolocator().checkGeolocationPermissionStatus();
    if (status == GeolocationStatus.granted) {
      var val = await Geolocator().isLocationServiceEnabled();
      if (val)
        return Geolocator().getCurrentPosition();
      else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Please Check your location settings'),
        ));
        return Geolocator().getLastKnownPosition();
      }
    }else
      return Future.error(false);
  }

  Future<void> tryToLocate(context) async {
    bool err = false;
    Position loc = await getLocation(context).catchError((val){err = true;});

    if(!err){
      LatLng newPos = new LatLng(loc.latitude, loc.longitude);
      setState(() {
        _position = newPos;
        _zoom = 13;
        mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _position, zoom: _zoom)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    tryToLocate(context);
    return Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    child: Image.asset("assets/image/logo-cropped.png")))),
        body: CustomContainer(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: _position, zoom: _zoom),
            )
        ),
    floatingActionButton: FloatingActionButton(
      tooltip: "Locate Me",
      onPressed: ()=>tryToLocate(context),
      child: Icon(Icons.adjust),
      backgroundColor: Colors.white,
    ),
      );
  }
}
