import 'package:deutalk/model/DaftarModulBelajarModel.dart';
import 'package:deutalk/model/DaftarSoalModulLatihanModel.dart';

class EventBusService {
  // modul belajar
  DaftarModulBelajarModel daftarModulBelajarModel;

  //soal latihan
  DaftarSoalModulLatihanModel daftarSoalModulLatihanModel;

  //simpan data soal yang dikerjaan user per modul
  // List progressLatihanUser = [
  //   {
  //     'namaModul' : '123',
  //     'soalSelesai' : [1,2,23,]
  //   }
  // ];
  List progressLatihanUser = [];
}
