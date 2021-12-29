import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas_android/model/data.dart';
import 'package:fluttertoast/fluttertoast.dart';



class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  final _fakultasController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _mahasiswaFormKey = GlobalKey<FormState>();
  late final Box box;

  _open() async{
    await Hive.openBox('dataMahasiswa');
    box = Hive.box('dataMahasiswa');  
  }
  
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    _open();
  }

  
  
  _addData() async {
      Data newData = Data(nim:_nimController.text,nama: _namaController.text, fakultas: _fakultasController.text,jurusan:_jurusanController.text );
      box.add(newData);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Mahasiswa')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _mahasiswaFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: TextFormField(
                      controller: _nimController,
                      validator: _fieldValidator,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.featured_play_list),
                        labelText: 'NIM',
                      ),
                    ),
                  ),
                 Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: TextFormField(
                      controller: _namaController,
                      validator: _fieldValidator,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Nama',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: TextFormField(
                      controller: _fakultasController,
                      validator: _fieldValidator,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.laptop_chromebook),
                        labelText: 'Fakultas',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: TextFormField(
                      controller: _jurusanController,
                      validator: _fieldValidator,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.school),
                        labelText: 'Jurusan',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(120),
                    child: ElevatedButton(onPressed:()
                    {
                      
                      
                      if (_mahasiswaFormKey.currentState!.validate()) {
                      _addData();
                    _mahasiswaFormKey.currentState!.reset();
                      Fluttertoast.showToast(
                          msg: "Berhasil Menyimpan",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      
                      
                      
                    }
                   
                    },child: Center(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                Text('Simpan')],)) ),
                  ),

                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
 
String? _fieldValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field can\'t be empty';
  }
  return null;
}


