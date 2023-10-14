import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:kncha_app/feautures/home/domain/models/cities.dart';

class CitiesServices {
  static Future<List<Cities>> getCities() async {
    const url = "https://us-central1-topsitesdev-202308.cloudfunctions.net/locations_colombia";
 final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
    };
    try {
        final http.Response response = await http.post(Uri.parse(url),
        headers: header, body: json.encode({"tipo_usuario": "cliente"}));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            json.decode(response.body.toString());

        List<Cities> cities =
            jsonData.map((citiesJson) => Cities.fromJson(citiesJson)).toList();
        return cities;
      } else {
        throw Exception("Error al consumir el servicio");
      }
    } catch (e) {
      throw Exception("Error al consumir el servicio: $e");
    }
  }
}
