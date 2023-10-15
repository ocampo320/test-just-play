import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/utils/app_typography.dart';

class InputJustPlay extends StatelessWidget {
  const InputJustPlay({
    Key? key,
    required this.placeHolder,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
    this.keyboard,
    this.validationText,
    this.width,
    this.textColor,
    this.borderColor,
    this.showPassword,
    this.suffixIcon,
    this.obscureText=false,
  }) : super(key: key);

  final String placeHolder;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final TextInputType? keyboard;
  final String? validationText;
  final double? width;
  final Color? textColor;
  final Color? borderColor;
  final Function()? showPassword;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          TextField(
            cursorColor: ColorManager.primary100,
            controller: controller,
            obscureText: obscureText??false,
            enableSuggestions: !isPassword,
            autocorrect: !isPassword,
            onChanged: onChanged,
            keyboardType: keyboard ?? TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            style: AppTypography.stRaleway(
              color: textColor ?? ColorManager.neutralWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            
            decoration: InputDecoration(
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 20, minWidth: 20),
              suffixIcon: isPassword == true
                  ? IconButton(
                      icon: Icon(
                        obscureText! ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey, // Personalice el color del icono
                      ),
                      onPressed: showPassword,
                    )
                  : suffixIcon,
              fillColor: Colors.transparent,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(
                  12, 12, 0, 12), // Añade padding a la izquierda
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorManager.neutralWhite,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorManager.comentary03_900,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              hintStyle: AppTypography.stRaleway(
                color: textColor ?? ColorManager.neutralWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              hintText: placeHolder,
            ),
          ),
          validationText != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: SizedBox(
                    width: 260,
                    child: Row(
                      children: [
                        Icon(Icons.error,
                            size: 20, color: ColorManager.comentary01_100),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            validationText!,
                            style: AppTypography.stRaleway(
                              color:
                                  ColorManager.gradientsColorsPrimary011Opa100,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
