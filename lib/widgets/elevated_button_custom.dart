
import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fontsize.dart';
class ElevatedButtonCustom extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;
  final double widthButton;
  final double elevation;
  final Color color;

  const ElevatedButtonCustom({
    required this.onPressed,
    required this.text,
    this.color = Colors.blue,
    this.elevation = 3,
    required this.widthButton,
  });


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double larguraBotao = widthButton;
    return SizedBox(
      width: larguraBotao,
      height: getHeightButton(context),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: elevation,

          shape: StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(
          fontFamily: FontsApp.mulishBold,
          fontSize: fontSizeButton(getHeightButton(context),

          ),
            color: Colors.blue
      ),),
      ),
    );
  }
}