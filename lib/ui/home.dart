import 'package:flutter/material.dart';
import 'package:uas_android/model/maps.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uas_android/ui/data.dart';
import 'package:uas_android/ui/input.dart';
import 'package:uas_android/ui/maps.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late OnPlace onPlace;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CRUD HIVE FLUTTER')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image.asset(
              'assets/Flutter.png',
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DataMahasiswa()));
                    },
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.format_list_bulleted),
                        Text(' List Data Mahasiswa')
                      ],
                    ))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InputData()));
                    },
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.playlist_add),
                        Text(' Input Data Mahasiswa')
                      ],
                    ))),
                ElevatedButton(
                    onPressed: () async {
                      Position position = await _getGeoLocationPosition();

                      OnPlace onPlace =
                          OnPlace(position.latitude, position.longitude);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapsPages(onPlace: onPlace)));
                    },
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on),
                        Text(' Lokasi Kampus UMB')
                      ],
                    ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
