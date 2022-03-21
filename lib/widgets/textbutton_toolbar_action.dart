import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fontsize.dart';
import 'package:ritmosdeviolaoxplus/styles/app_iconsize.dart';

class TextButtonToolbar extends StatelessWidget {

  final Function onPressed;
  final IconData iconData;
  final String? text;
  final Color? iconColorButtonRitmando;

  const TextButtonToolbar({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.iconColorButtonRitmando,
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            overlayColor: MaterialStateProperty.all(overlayColorDefaultIconsToolbar)
        ),
        child: text == null ?
        Icon(iconData, color: iconColorButtonRitmando,
          size: getIconSize(context) * 1.4,) :
          Row(
            children: [
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: Icon(iconData, color: iconColorButtonRitmando,
              size: getIconSize(context) ),
            ),
            SizedBox(width: 10,),
            Text(text!,style: TextStyle(
              fontFamily: FontsApp.mulishBold,
              fontSize: getFontTitleToolbar(context),
              color: Colors.white,
              decoration: TextDecoration.underline
            ),)
            ],
          ));
  }
}