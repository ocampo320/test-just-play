import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/feautures/players/application/bloc/player_state.dart';
import 'package:kncha_app/feautures/profile/domain/repository/player_repository.dart';
import 'player_event.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerRepository playerRepository;
  PlayerBloc(this.playerRepository) : super(const PlayerState.initial()) {
    on<PlayerStarted>(getData);
  }

  FutureOr<void> getData(PlayerStarted event, Emitter<PlayerState> emit) async {
    emit(const PlayerState.loading());
    final state = await playerRepository.getPlayerRepository();
    emit(
      state.fold(
        (error) => PlayerState.error(failure: error),
        (data) => PlayerState.data(playerResponse: data),
      ),
    );
  }
}
