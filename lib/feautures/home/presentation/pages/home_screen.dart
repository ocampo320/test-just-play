import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/core/widgets/custom_buttom_bar.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/presentation/pages/save_screen.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Clase que representa la pantalla principal (home) de la aplicación.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Inicia un evento en el bloc de Home cuando se construye la pantalla.
    context.read<HomeBloc>().add(
          HomeStarted(),
        );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.comentary03_900,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SavePage()),
        ),
        child: const Icon(Icons.add),
      ),
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
      body: SafeArea(
        child: Scaffold(
          bottomNavigationBar: const CustomBottomBar(
            currentIndex: 0,
          ),
          backgroundColor: ColorManager.neutral600,
          body: const SingleChildScrollView(
            child: CardWidget(),
          ),
        ),
      ),
    );
  }
}
