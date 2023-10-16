import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kncha_app/feautures/players/domain/models/player_response.dart';

class PlayerServices {
 static  Future<PlayerResponse> getPlayers() async {
    const url = "https://api.sportmonks.com/v3/football/players";
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'AUTHORIZATION':
          'yFFmgm4hHcPfHWj7cZCdYpQ66Kh4fIKvYbOSqA8Bq7jKi715HzHKdSO4yePK'
    };
    final http.Response accountResponse = await http.get(
      Uri.parse(url),
      headers: header,
    );

    if (accountResponse.statusCode == 200) {
      final jsonData = json.decode(accountResponse.body.toString());
      final response = PlayerResponse.fromJson(jsonData);

      return response;
    } else {
      throw Exception("Error al consumir el servicio");
    }
  }
}
