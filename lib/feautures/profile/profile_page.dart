import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/core/widgets/button_just_play.dart';
import 'package:kncha_app/feautures/login/login_view.dart';
import 'package:kncha_app/feautures/profile/presentation/widgets/card_account.dart';

import 'domain/models/user_profile.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile userProfile;

  const ProfilePage({required this.userProfile});

  void _logout() {
    // Aquí puedes implementar la lógica para cerrar la sesión del usuario
    // Por ejemplo, borrar el token de autenticación y redirigir al usuario a la pantalla de inicio de sesión.
    // Esto dependerá de cómo manejas la autenticación en tu aplicación.
    print('Sesión cerrada');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.neutral600,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.keyboard_backspace_rounded,
              color: Colors.white,
            )),
        backgroundColor: ColorManager.neutral600,
        centerTitle: true,
        title: Text(
          "Mi Perfil",
          style: AppTypography.stRaleway(
            color: ColorManager.neutralWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Mostrar la imagen del perfil
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(userProfile.imageUrl),
                  ),
                  const SizedBox(height: 20),
                  CardAccount(
                    isSubtitle: false,
                    onTap: () {},
                    title: "jhon due",
                  ),
                  CardAccount(
                    isSubtitle: false,
                    onTap: () {},
                    title: "jhon due@gmail.com",
                  ),
                  // Mostrar el nombre del usuario
                  const SizedBox(height: 20),
                  ButtonJustPlay(
                    color: ColorManager.gradientsColorsPrimary012Opa100,
                    colorText: Colors.white,
                    fontSize: 16,
                    height: 40,
                    width: double.infinity,
                    title: 'Cerrar Sesión',
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
