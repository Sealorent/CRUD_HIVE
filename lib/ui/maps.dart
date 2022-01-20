import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uas_android/model/maps.dart';

class MapsPages extends StatefulWidget {
  final OnPlace onPlace;
  const MapsPages({Key? key, required this.onPlace}) : super(key: key);

  @override
  _MapsPagesState createState() => _MapsPagesState(onPlace: onPlace);
}

class _MapsPagesState extends State<MapsPages> {
  OnPlace onPlace;

  _MapsPagesState({required this.onPlace}) : super();
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  final Set<Marker> markers = new Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
        compassEnabled: true,
        markers: getmarkers(),
        initialCameraPosition: CameraPosition(
          target: LatLng(onPlace.latitude, onPlace.longtitude),
          zoom: 10.0,
        ),
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add second marker
        markerId: MarkerId(onPlace.toString()),
        position:
            LatLng(onPlace.latitude, onPlace.longtitude), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
