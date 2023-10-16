import 'package:flutter/material.dart';
import 'package:kncha_app/core/data/court_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/feautures/players/application/bloc/player_bloc.dart';
import 'package:kncha_app/feautures/profile/domain/repository/player_repository.dart';

import 'feautures/home/application/bloc/home_bloc.dart';
import 'feautures/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CourtStore(),
        ),
        RepositoryProvider(
          create: (context) => PlayerRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(courtStore: CourtStore()),
          ),
          BlocProvider(create: (context) => PlayerBloc(PlayerRepository())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Just play App',
          home: LoginScreen(),
        ),
      ),
    );
  }
}
