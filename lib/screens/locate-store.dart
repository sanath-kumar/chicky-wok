import 'dart:async';

import 'package:chickywok/widgets/app-navigation.dart';
import 'package:chickywok/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocateStore extends StatefulWidget {
  @override
  _LocateStoreState createState() => _LocateStoreState();
}

class _LocateStoreState extends State<LocateStore> {
  static LatLng pinPosition = LatLng(37.3797536, -122.1017334);
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    myLocation();
    return Scaffold(
      appBar: TopBar(false),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: pinPosition,
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) async {
                    _controller.complete(controller);
                    print("on map created");
                  }
              ),
            ),
          ],
        ),

      ),
    );
  }

  Future<void> myLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    pinPosition = LatLng(position.latitude, position.longitude);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: pinPosition, zoom: 13),
      ),
    );
  }
}
