// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kncha_app/core/color_manager.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/core/widgets/button_just_play.dart';
import 'package:kncha_app/core/widgets/input_just_play.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:kncha_app/feautures/home/domain/models/cities.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:kncha_app/feautures/home/domain/services/cities_services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/drop_down_just_play.dart';

class SavePage extends StatelessWidget {
  const SavePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Agendar Cancha',
          style: AppTypography.stRaleway(
            color: ColorManager.neutralWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SaveForm(),
    );
  }
}

class SaveForm extends StatefulWidget {
  const SaveForm({super.key});

  @override
  _SaveFormState createState() => _SaveFormState();
}

class _SaveFormState extends State<SaveForm> {
  final _formKey = GlobalKey<FormState>();
  List courts = ["Cancha grande", "Cancha media", "Cancha peque"];
  List playType = ["Baloncesto", "béisbol", "básquetbol"];
  TextEditingController dateInput = TextEditingController(text: '');
  TextEditingController userInput = TextEditingController(text: '');
  TextEditingController courtInput = TextEditingController(text: '');
  TextEditingController playInput = TextEditingController(text: '');
  TextEditingController citieInput = TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: Column(
              children: [
                TextField(
                  style: AppTypography.stRaleway(
                    color: ColorManager.neutral600,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                    hintStyle: AppTypography.stRaleway(
                      color: ColorManager.neutral600,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Fecha',
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: ColorManager.neutral600,
                    ),
                  ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    setState(() {
                      validateButtom();
                    });

                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      dateInput.text = formattedDate;
                    } else {}
                  },
                ),
                InputJustPlay(
                  textColor: ColorManager.neutral600,
                  onChanged: (v) {
                    setState(() {
                      validateButtom();
                    });
                  },
                  controller: userInput,
                  placeHolder: 'Nombre del responsable',
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropDownJustPlay(
                    function: () => validateButtom(),
                    item: courts,
                    title: 'Selecciona cancha',
                    onChange: (String? newValue) {
                      setState(() {
                        validateButtom();
                        courtInput.text = newValue ?? '';
                      });
                    },
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: DropDownJustPlay(
                      function: () => validateButtom(),
                      item: playType,
                      title: 'Tipo de juego',
                      onChange: (String? newValue) {
                        setState(() {
                          validateButtom();
                          playInput.text = newValue ?? '';
                        });
                      },
                    )),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder<List<Cities>>(
                      future: CitiesServices.getCities(),
                      builder: (context, listCities) {
                        return listCities.hasData
                            ? DropDownJustPlay(
                                function: () => validateButtom(),
                                item: listCities.data![1].ciudades,
                                title: 'Ciudad',
                                onChange: (String? newValue) {
                                  setState(() {
                                    validateButtom();
                                    citieInput.text = newValue ?? '';
                                  });
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: ColorManager.neutral600,
                              ));
                      }),
                ),
                const SizedBox(
                  height: 25,
                ),
                ButtonJustPlay(
                  color: ColorManager.neutral600,
                  colorText: Colors.white,
                  fontSize: 16,
                  onTap: validateButtom() == false
                      ? () async {
                          var coutn = await context
                              .read<HomeBloc>()
                              .getCountAndSum(courtInput.text);

                          final vaialblecourt = await context
                              .read<HomeBloc>()
                              .isCourtAvailable(
                                  dateInput.text, courtInput.text);
                          if (vaialblecourt == false) {
                            showAlertDialog(context);
                          } else {
                            context.read<HomeBloc>().add(SaveCourtStarted(Court(
                                count: coutn,
                                court: courtInput.text,
                                date: dateInput.text,
                                user: userInput.text,
                                playType: playInput.text,
                                citie: citieInput.text)));
                            Navigator.pop(context);
                          }
                        }
                      : () {},
                  title: "Guardar",
                  width: double.infinity,
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bool validateButtom() {
    var isActive = false;
    if (dateInput.text.isNotEmpty &&
        userInput.text.isNotEmpty &&
        courtInput.text.isNotEmpty) {
      isActive = false;
    } else {
      isActive = true;
      ;
    }
    return isActive;
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: const Text("Esta cancha ya no tiene cupo por hoy"),
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
