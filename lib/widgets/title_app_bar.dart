import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fontsize.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
        fontFamily: FontsApp.mulishBold,
        fontSize: getFontTitleToolbar(context)
    ),);
  }
}
