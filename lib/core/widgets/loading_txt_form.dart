import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';


class LoadingTxtForm extends StatelessWidget {
  const LoadingTxtForm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.topCenter,
        widthFactor: 1,
        heightFactor: 1,
        child: SizedBox(
          width: 15,
          height: 15,
          child:  CircularProgressIndicator(
            strokeWidth: 1,
            color: ColorManager.comentary03_800,
          ),
        ),
      ),
    );
  }
}
