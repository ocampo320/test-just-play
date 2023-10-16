import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/core/widgets/custom_buttom_bar.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/presentation/pages/save_screen.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    context.read<HomeBloc>().add(
          HomeStarted(),
        );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScaleTransition(
        scale: Tween(begin: 1.0, end: 1.1).animate(_controller),
        child: FloatingActionButton(
          backgroundColor: ColorManager.comentary03_900,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SavePage()),
          ),
          child: const Icon(Icons.add),
        ),
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
