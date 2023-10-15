import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kncha_app/feautures/home/domain/models/type_play.dart';

class TypePlayServices {
  static Future<List<TypePlay>> getTypePlay() async {
    const url = "https://list-court.free.beeceptor.com/play-type";
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body.toString());

        List<TypePlay> cities =
            jsonData.map((data) => TypePlay.fromJson(data)).toList();
        return cities;
      } else {
        throw Exception("Error al consumir el servicio");
      }
    } catch (e) {
      throw Exception("Error al consumir el servicio: $e");
    }
  }
}
