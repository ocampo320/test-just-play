import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';

class PlayerListTitle extends StatelessWidget {
  const PlayerListTitle(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 16,
          color: ColorManager.neutralWhite,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(subTitle,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
            color: ColorManager.neutralWhite,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
