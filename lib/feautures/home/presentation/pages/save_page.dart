import 'package:flutter/material.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:kncha_app/feautures/home/domain/models/cities.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:kncha_app/feautures/home/domain/services/cities_services.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/dropdown_custom.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/textField_widget.dart';

import '../../../../core/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SavePage extends StatelessWidget {
  const SavePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agendar Cancha'),
      ),
      body: SaveForm(),
    );
  }
}

class SaveForm extends StatefulWidget {
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
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: const InputDecoration(
                    hintText: 'Fecha',
                    suffixIcon: Icon(Icons.calendar_today),
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
                TextFormFieldCustom(
                  onChanged: (v) {
                    setState(() {
                      validateButtom();
                    });
                  },
                  controller: userInput,
                  hintText: 'Nombre del responsable',
                  labelText: '',
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    onTap: () {
                      setState(() {
                        validateButtom();
                      });
                    },
                    hint: const Text('Selecciona cancha'),
                    // Down Arrow Icon
                    icon: Row(
                      children: const [
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),

                    // Array list of items
                    items: courts.map((items) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            validateButtom();
                          });
                        },
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        validateButtom();
                        courtInput.text = newValue ?? '';
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    onTap: () {
                      setState(() {
                        validateButtom();
                      });
                    },
                    hint: const Text('Tipo de juego'),
                    // Down Arrow Icon
                    icon: Row(
                      children: const [
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),

                    // Array list of items
                    items: playType.map((items) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            validateButtom();
                          });
                        },
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        validateButtom();
                        playInput.text = newValue ?? '';
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder<List<Cities>>(
                      future: CitiesServices.getCities(),
                      builder: (context, listCities) {
                        return listCities.hasData
                            ? DropdownButtonFormField(
                                onTap: () {
                                  setState(() {
                                    validateButtom();
                                  });
                                },
                                hint: const Text('Ciudad'),
                                // Down Arrow Icon
                                icon: Row(
                                  children: const [
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),

                                // Array list of items
                                items: listCities.data!.map((items) {
                                  return DropdownMenuItem<String>(
                                    onTap: () {
                                      setState(() {
                                        validateButtom();
                                      });
                                    },
                                    value: items.ciudades!.first,
                                    child: Text(items.ciudades!.first),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    validateButtom();
                                    citieInput.text = newValue ?? '';
                                  });
                                },
                              )
                            : const Center(child: CircularProgressIndicator());
                      }),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: double.infinity,
                    child: validateButtom() == false
                        ? ElevatedButton(
                            onPressed: () async {
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
                                context.read<HomeBloc>().add(SaveCourtStarted(
                                    Court(
                                        count: coutn,
                                        court: courtInput.text,
                                        date: dateInput.text,
                                        user: userInput.text,
                                        playType: playInput.text,
                                        citie: citieInput.text)));
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Guardar'))
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.grey;
                                  }
                                  return Colors.grey;
                                },
                              ),
                            ),
                            onPressed: () async {},
                            child: const Text('Guardar')))
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
