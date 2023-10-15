/// Este archivo contiene la implementación de la pantalla de inicio de sesión.

import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/widgets/application/validate_password_bloc.dart';
import 'package:kncha_app/core/widgets/button_just_play.dart';
import 'package:kncha_app/core/widgets/input_just_play.dart';
import 'package:kncha_app/feautures/login/application/login_services.dart';
import 'package:kncha_app/feautures/welcome/welcome.dart';

/// Clase que representa la pantalla de inicio de sesión.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // Controladores para los campos de usuario y contraseña
    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // Decoración con una imagen de fondo
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Constants.mainImage),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.comentary01_100),
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          Constants.iconImage,
                          color: ColorManager.primary100,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InputJustPlay(
                        placeHolder: Constants.name,
                        controller: user,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<bool>(
                        initialData: false,
                          stream: ValidatePasswordBloc().isObscureTextStream,
                          builder: (context, snapsisObscureText) {
                            return InputJustPlay(
                              
                              obscureText: snapsisObscureText.data ?? true,
                              showPassword: () =>
                                  ValidatePasswordBloc().setIsObscure(true),
                              isPassword: true,
                              controller: password,
                              placeHolder: Constants.password,
                            );
                          }),
                      const SizedBox(
                        height: 70,
                      ),
                      ButtonJustPlay(
                        colorText: ColorManager.neutralWhite,
                        height: 45,
                        width: 180,
                        title: Constants.logIn,
                        color: ColorManager.comentary03_900,
                        onTap: () {
                          // Lógica de inicio de sesión
                          AuthServices.login(
                                  user.value.text, password.value.text)
                              .then((value) {
                            if (value) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              showAlertDialog(Constants.loginError);
                            }
                          });
                        },
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Muestra un cuadro de diálogo de alerta con un mensaje dado.
  showAlertDialog(String message) {
    // Configura el AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Center(child: Text(Constants.attention)),
      content: Text(message),
    );

    // Muestra el cuadro de diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
