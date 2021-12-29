import 'package:hive/hive.dart';
part 'data.g.dart';

@HiveType(typeId: 1)
class Data{
  @HiveField(0)
  final String nim;
  @HiveField(1)
  final String nama;
  @HiveField(2)
  final String fakultas;
  @HiveField(3)
  final String jurusan;

  Data({required this.nim,required this.nama,required this.fakultas,required this.jurusan});
} 
