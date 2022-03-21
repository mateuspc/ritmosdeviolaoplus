import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fontsize.dart';
class TextButtonCustom extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;
  final double widthButton;
  final double elevation;
  final Color color;
  final Color textColor;

  const TextButtonCustom({
    required this.onPressed,
    required this.text,
    this.color = ColorsApp.primaryLight,
    this.elevation = 3,
    required this.widthButton,
    this.textColor = Colors.white
  });


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double larguraBotao = widthButton != null ? widthButton : size.width * 0.5;
    return SizedBox(
      width: larguraBotao,
      height: getHeightButton(context),
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(StadiumBorder()),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(
            fontFamily: FontsApp.mulishBold,
            fontSize: fontSizeButton(getHeightButton(context)),
            color: textColor
        ),),
      ),
    );
  }
}