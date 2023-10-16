import 'package:dartz/dartz.dart';
import 'package:kncha_app/core/failures/common_failure.dart';
import 'package:kncha_app/feautures/players/domain/models/player_response.dart';
import 'package:kncha_app/feautures/profile/domain/services/player_services.dart';

class PlayerRepository{
  Future<Either<CommonFailure, PlayerResponse>> getPlayerRepository() async {
    try {
         final data  = await PlayerServices.getPlayers();
      return right(data);
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }
}