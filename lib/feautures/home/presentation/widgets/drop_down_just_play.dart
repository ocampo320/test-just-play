import 'package:flutter/material.dart';
import 'package:kncha_app/core/color_manager.dart';
import 'package:kncha_app/core/utils/app_typography.dart';

class DropDownJustPlay extends StatefulWidget {
  const DropDownJustPlay(
      {super.key,
      this.function,
      this.title,
      this.item,
      required this.onChange});
  final Function? function;
  final String? title;
  final List<dynamic>? item;
  final Function(String?) onChange;

  @override
  State<DropDownJustPlay> createState() => _DropDownJustPlayState();
}

class _DropDownJustPlayState extends State<DropDownJustPlay> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        onTap: () {
          setState(() {
            widget.function;
          });
        },
        hint: Text(widget.title ?? "",
            style: AppTypography.stRaleway(
              color: ColorManager.neutral600,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        icon: Row(
          children: [
            Icon(Icons.keyboard_arrow_down, color: ColorManager.neutral600),
          ],
        ),
        items: widget.item!.map((items) {
          return DropdownMenuItem<String>(
            onTap: () {
              setState(() {
                widget.function;
              });
            },
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: widget.onChange);
  }
}
