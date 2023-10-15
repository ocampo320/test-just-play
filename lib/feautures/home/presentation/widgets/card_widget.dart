import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/core/widgets/button_just_play.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:kncha_app/feautures/home/domain/services/weather_map_services.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/text_item_card.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, this.nameCourt, this.date, this.userName});
  final String? nameCourt;
  final String? date;
  final String? userName;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeStarted());
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeStarted());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.when(
            save: (b) => const SizedBox(),
            initial: () => const SizedBox(child: Center(child: Text('data'))),
            loading: () => const Center(child: CircularProgressIndicator(color: Colors.white,)),
            data: (data) => Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Column(
                    children: data
                        .map(
                          (e) => Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: FutureBuilder<String>(
                                        future: WeatherMapServices
                                            .getWeatherMapServices(
                                                'city', e.date ?? ''),
                                        builder: (context, snapshot) {
                                          return snapshot.data != null
                                              ? Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: Icon(
                                                        Icons.wb_cloudy_sharp,
                                                        size: 25,
                                                      ),
                                                    ),
                                                    Text(snapshot.data
                                                        .toString()),
                                                  ],
                                                )
                                              : const SizedBox();
                                        }),
                                    leading: const Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Icon(
                                        Icons.check_circle_outline,
                                        size: 40,
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Column(
                                        children: [
                                          TextItemCard(
                                            text: e.user,
                                          ),
                                          TextItemCard(
                                            text: e.date,
                                          ),
                                          TextItemCard(
                                            text: e.playType,
                                          ),
                                          TextItemCard(
                                            text: e.citie,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          bottom: 20,
                                          top: 16),
                                      child: ButtonJustPlay(
                                        color: ColorManager.neutral600,
                                        colorText: Colors.white,
                                        fontSize: 16,
                                        height: 30,
                                        width: double.infinity,
                                        onTap: () =>
                                            showAlertDialog(context, e),
                                        title: Constants.deleteSchedule,
                                      )),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            error: (error) {
              return Text(error.message);
            });
      },
    );
  }
}

showAlertDialog(BuildContext context, Court e) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(Constants.accept,
        style: AppTypography.stRaleway(
          color: ColorManager.neutral900,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
    onPressed: () {
      context.read<HomeBloc>().add(
            DeleteStarted(e),
          );
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(Constants.attention),
    content: const Text(Constants.areYouSure),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
