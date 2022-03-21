

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showAlertInfo(
    {required BuildContext context,
    required String title,
    required Widget child,
    required String textButton,
    required Function onPressed}){
  Alert(context: context, title: title,
      content: child,
      buttons: [
        DialogButton(child: Text(textButton, style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700
        )), onPressed: () => onPressed(),
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.zero,
            height: 52)
      ]).show();
}