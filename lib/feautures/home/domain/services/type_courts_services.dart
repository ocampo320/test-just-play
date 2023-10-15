import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kncha_app/feautures/home/domain/models/type_courts.dart';

class TypeCourtServices {
  static Future<List<TypeCourt>> getTypeCourts() async {
    const url = "https://list-court.free.beeceptor.com/courts";
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body.toString());

        List<TypeCourt> cities =
            jsonData.map((data) => TypeCourt.fromJson(data)).toList();
        return cities;
      } else {
        throw Exception("Error al consumir el servicio");
      }
    } catch (e) {
      throw Exception("Error al consumir el servicio: $e");
    }
  }
}
