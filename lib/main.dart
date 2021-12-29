import 'package:flutter/material.dart';
import 'package:uas_android/model/data.dart';
import 'package:uas_android/ui/home.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  await Hive.openBox('dataMahasiswa');
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Home(),
    );
  }
}
