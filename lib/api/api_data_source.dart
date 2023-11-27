import 'package:projek/helper/baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<Map<String, dynamic>> loadFilm() {
    return BaseNetwork.get("film");
  }
  Future<Map<String, dynamic>> loadDetailFilm(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetwork.get("film/$id");
  }
}
