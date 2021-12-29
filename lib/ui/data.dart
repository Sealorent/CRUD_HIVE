
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataMahasiswa extends StatefulWidget {
  
  const DataMahasiswa({Key? key}) : super(key: key);

  @override
  _DataMahasiswaState createState() => _DataMahasiswaState();
}

class _DataMahasiswaState extends State<DataMahasiswa> {
   late final Box dataMahasiswa;

  _deleteInfo(int index) {
    dataMahasiswa.deleteAt(index);
  }

 
  
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    Hive.openBox('dataMahasiswa');
    dataMahasiswa = Hive.box('dataMahasiswa');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Mahasiswa'),),
      body: ValueListenableBuilder(
          valueListenable: dataMahasiswa.listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return const Center(
                child: Text('Empty'),
              );
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var currentBox = box;
                  var personData = currentBox.getAt(index)!;
                  return InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.blueAccent,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(personData.nama),
                              Text(personData.nim)
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: 
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text( "Fakultas:" +"  "+ personData.fakultas,textAlign: TextAlign.left,),
                                        Text( "Jurusan:" + "  "+personData.jurusan,textAlign: TextAlign.left),
                                      ],
                                    ),
                                  ),
                                ),
                             
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => _deleteInfo(index),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
      )
    );
  }
} 

