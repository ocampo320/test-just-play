import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kncha_app/core/constans/color_manager.dart';
import 'package:kncha_app/feautures/profile/presentation/widgets/contet_card_account.dart';


class CardAccount extends StatelessWidget {
  const CardAccount(
      {super.key,
      this.title,
      this.subTitle,
      this.actionText,
       this.icon,
      required this.isSubtitle,  this.avatarImage, required this.onTap});
  final String? title;
  final String? subTitle;
  final String? actionText;
  final String ? icon;
  final bool isSubtitle;
  final String ? avatarImage;
  final Function()onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: ColorManager.gradientsColorsNeutral011Opa70),
        ),
        color: kIsWeb ? ColorManager.neutral800 : ColorManager.neutral900,
        child: SizedBox(
            height: 106,
            child: ContentCardAccount(
              ontap: onTap,
              avatarImage: avatarImage,
              icon: icon,
              actionText: '',
              isSubtitle: isSubtitle,
              subTitle: subTitle,
              title: title,
            )),
      ),
    );
  }
}
