import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/feautures/players/player_screen.dart';
import 'package:kncha_app/feautures/profile/domain/models/user_profile.dart';
import 'package:kncha_app/feautures/profile/profile_screen.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final bool hasGoBackModal;
  final Future<bool?> Function(BuildContext)? goBackModal;

  const CustomBottomBar({
    super.key,
    this.currentIndex = 0,
    this.hasGoBackModal = false,
    this.goBackModal,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      maintainBottomViewPadding: true,
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          color: ColorManager.textLightMedium,
        ),
        child: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 40,
          children: [
            _buildIcon(
              Constants.favoriteHeartIcon,
              1,
              context,
            ),
            _buildIcon(
              Constants.interfaceUserCircleIcon,
              2,
              context,
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (currentIndex == index) {
      return;
    }
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlayerScreen(),
          ),
        );
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              userProfile: UserProfile(
                  name: "John Doe",
                  email: "John Doe@hotmail.com",
                  imageUrl:
                      "https://westernfinance.org/wp-content/uploads/speaker-3-v2.jpg"),
            ),
          ),
        );
        break;
      case 3:
        break;
    }
  }

  /* void handleNavigate(
      {required BuildContext context,
      required PageRouteInfo<dynamic> pageRouteInfo}) {
    if (context.router.isRouteActive(const HomeRoute().routeName)) {
      context.router.replaceAll([pageRouteInfo]);
    } else {
      context.router.navigate(pageRouteInfo);
    }
  } */

  /// _svgPicture() is a function that takes in an asset name and an optional color, and returns a
  /// Container with a SvgPicture inside
  ///
  /// Args:
  ///   assetName (String): The name of the asset to be used.
  ///   color (Color): The color of the icon.
  ///
  /// Returns:
  ///   A Container widget with a SvgPicture widget inside of it.
  Widget _svgPicture(String assetName, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SvgPicture.asset(
        assetName,
        width: 20,
        height: 20,
        color: color,
      ),
    );
  }

  /// If the current index is the same as the index passed in, return the main color, otherwise return
  /// the gray input color
  ///
  /// Args:
  ///   index (int): the index of the item in the list
Color _getBgColor(int index) {
  if (currentIndex == index) {
    // Cambia el color de fondo cuando está seleccionado
    return Colors.blue; // Puedes usar el color que desees
  } else {
    return Colors.white; // Color de fondo cuando no está seleccionado
  }
}

Widget _buildIcon(
  String assetName,
  int index,
  BuildContext context,
) =>
  SizedBox(
    width: MediaQuery.of(context).size.width / 4,
    child: InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            decoration: BoxDecoration(
              border: Border.all(
                color: _getBgColor(index),
                width: 2.0, // Grosor del borde
              ),
              borderRadius: const BorderRadius.all(Radius.circular(26)),
              color: Colors.transparent, // Fondo transparente
            ),
            child: Transform.scale(
              scale: currentIndex == index ? 1.02 : 1.0, // Escala 2% más grande cuando está seleccionado
              child: SvgPicture.asset(
                assetName,
                width: 24,
                height: 24,
                color: _getBgColor(index), // Cambia el color del ícono a tu preferencia
              ),
            ),
          ),
        ],
      ),
      onTap: () async {
        if (hasGoBackModal) {
          goBackModal!(context).then((exit) {
            if (exit != null && exit) {
              _onItemTapped(context, index);
            }
          });
        } else {
          _onItemTapped(context, index);
        }
      },
    ),
  );
}
