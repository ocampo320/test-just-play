import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kncha_app/core/failures/common_failure.dart';
import 'package:kncha_app/feautures/players/domain/models/player_response.dart';


part 'player_state.freezed.dart';
@freezed
abstract class PlayerState with _$PlayerState {
  const PlayerState._();
  const factory PlayerState.initial() = _Initial;

  const factory PlayerState.loading() = _Loading;

  const factory PlayerState.data({required PlayerResponse playerResponse}) = _Data;

  const factory PlayerState.error({
    required CommonFailure failure,
  }) = _Error;
}