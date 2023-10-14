import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/core/utils/app_typography.dart';

class TextItemCard extends StatelessWidget {
  const TextItemCard({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text ?? '',
          style: AppTypography.stRaleway(
            color: ColorManager.neutral600,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
