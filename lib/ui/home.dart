import 'package:flutter/material.dart';
import 'package:uas_android/ui/data.dart';
import 'package:uas_android/ui/input.dart';

class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
        child:  Text('UAS FLUTTER')),),
      body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset('assets/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DataMahasiswa()));
                    }, child: Center(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Icon(Icons.format_list_bulleted),
                          Text(' List Data Mahasiswa')],)) ),
                    ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const InputData()));
                    }, child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.playlist_add),
                          Text(' Input Data Mahasiswa')],)) ),
                    ElevatedButton(onPressed: (){}, child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Icon(Icons.location_on),
                          Text(' Lokasi Kampus UMB')],)) ),
                  ],
                ),
              )
            ],
          ),
      );
  
  }
}