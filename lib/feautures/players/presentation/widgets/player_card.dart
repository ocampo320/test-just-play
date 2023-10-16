import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/feautures/players/domain/models/player_data.dart';

import 'player_content_image.dart';
import 'player_list_title.dart';

class PlayerCard extends StatelessWidget {
  final Data playerResponse;

  const PlayerCard({super.key, required this.playerResponse});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.neutral900,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: ColorManager.gradientsColorsNeutral011Opa70),
      ),
      elevation: 4, // Sombra de la tarjeta
      margin: const EdgeInsets.all(16), // Margen alrededor de la tarjeta
      child: Column(
        children: <Widget>[
          // Imagen del jugador
          PlayerContentImage(
            image: playerResponse.imagePath ?? "",
          ),

          // Información del jugador
          PlayerListTitle(
            title: playerResponse.name ?? "",
            subTitle: playerResponse.commonName ?? "",
          ),
          PlayerListTitle(
            title: '${Constants.birthdate}    ${playerResponse.commonName}',
            subTitle:
                '${Constants.height}   ${playerResponse.height} ${Constants.cm} , ${Constants.weight}  ${playerResponse.weight} ${Constants.kg} ',
          )
        ],
      ),
    );
  }
}
