import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_iconsize.dart';

class LeadingAppBar extends StatelessWidget {

  final Function onPressed;
  final IconData? iconData;

  const LeadingAppBar({
    Key? key,
    required this.onPressed,
    this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(Colors.transparent)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: isTableOrIpad(context) ? size.width * 0.02 : 5),
        child: Icon(iconData != null ? iconData
            : Platform.isAndroid ? Icons.arrow_back
            : Icons.arrow_back_ios,
            color: Colors.white,
            size: getIconSize(context) * 1.4),
      ),
    );
  }
}