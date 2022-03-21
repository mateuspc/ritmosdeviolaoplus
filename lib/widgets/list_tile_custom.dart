import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fontsize.dart';
import 'package:ritmosdeviolaoxplus/styles/app_iconsize.dart';

class ListTileCustom extends StatelessWidget {

  final String title;
  final IconData iconData;
  final Function onTap;
  final double height;

  ListTileCustom({required this.title,required  this.iconData,required this.onTap, required this.height});

  @override
  Widget build(BuildContext context) {
    double listTileHeight = getListTileHeight(context);
    double paddingHorizontal = listTileHeight * 0.25;
    double paddingVertical = listTileHeight * 0.1;

    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        height: getListTileHeight(context),
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
        child:  Row(
          children: [
            Icon(iconData,color: Colors.grey,
                size: getIconSize(context)),
            SizedBox(width: paddingHorizontal),
            Text(title, style: TextStyle(
                fontSize: getFontListTile(context)
            ))
          ],
        ),
      ),
    );
  }
}
