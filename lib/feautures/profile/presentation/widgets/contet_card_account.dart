import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kncha_app/core/constans/color_manager.dart';

import 'dart:math' as math;

import 'package:kncha_app/core/widgets/custom_gradient_box_decoration.dart';

class ContentCardAccount extends StatelessWidget {
  const ContentCardAccount(
      {super.key,
      this.title,
      this.subTitle,
      this.actionText,
      this.isSubtitle,
      required this.icon,
      this.avatarImage,
      required this.ontap});
  final String? title;
  final String? subTitle;
  final String? actionText;
  final bool? isSubtitle;
  final String? icon;
  final String? avatarImage;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
    
      leading: avatarImage != null
          ? SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(backgroundImage: NetworkImage(avatarImage!)))
          : Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: CustomGradientBoxDecoration(
                    gradientRotation: math.pi * 0.01,
                    gradientColors: [
                      ColorManager.gradientsColorsNeutral021Opa05,
                      ColorManager.gradientsColorsNeutral022Opa10
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ).gradient),
              child: icon != null
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(icon!),
                    )
                  : CircleAvatar(
                      backgroundColor: ColorManager.comentary03_600)),
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Text(
              title ?? "",
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
                color: ColorManager.neutralWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      subtitle: Column(
        children: [
          isSubtitle == true
              ? Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        subTitle ?? 'Sin datos',
                        style: TextStyle(
                          fontSize:16,
                          color: ColorManager.neutralWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          !kIsWeb
              ? InkWell(
                  borderRadius: BorderRadius.circular(7),
                  onTap: ontap,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              text: 'Actualizar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: [
                                      ColorManager
                                          .gradientsColorsPrimary012Opa100,
                                      ColorManager
                                          .gradientsColorsPrimary011Opa100
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(
                                      const Rect.fromLTWH(0, 0, 200, 100)),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
