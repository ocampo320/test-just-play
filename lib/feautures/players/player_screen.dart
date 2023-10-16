import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/core/widgets/loading_txt_form.dart';
import 'package:kncha_app/feautures/players/presentation/widgets/player_card.dart';

import 'application/bloc/player_bloc.dart';
import 'application/bloc/player_event.dart';
import 'application/bloc/player_state.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PlayerBloc>().add(PlayerStarted());
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      return state.when(
        data: (data) => Scaffold(
          backgroundColor: ColorManager.neutral600,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorManager.neutral600,
            title: Text(
              Constants.playerList,
              style: AppTypography.stRaleway(
                color: ColorManager.neutralWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
                children: data.data!
                    .map((e) => PlayerCard(playerResponse: e))
                    .toList()),
          ),
        ),
        error: (error) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: ColorManager.neutral600,
                title: Text(
                  Constants.scheduleCourts,
                  style: AppTypography.stRaleway(
                    color: ColorManager.neutralWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Center(child: Text(error.message)));
        },
        initial: () => const SizedBox(),
        loading: () => const Center(child: LoadingTxtForm()),
      );
    });
  }
}
