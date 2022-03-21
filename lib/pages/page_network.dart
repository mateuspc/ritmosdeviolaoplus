import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';

class PageInternetNotAvaliable extends StatefulWidget {
  @override
  _PageInternetNotAvaliableState createState() => _PageInternetNotAvaliableState();
}

class _PageInternetNotAvaliableState extends State<PageInternetNotAvaliable> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    LocalizationsApp locale = LocalizationsApp.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getToolbarHeight(context),
        title: TitleAppBar(title: locale.app_name),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Não foi possivel estabelecer a conexão com a '
                'internet, verifique e tente novamente!',
              textAlign: TextAlign.center, style: TextStyle(
                fontSize: height > 800 ? height * 0.025 : height * 0.03
              ),),
            SizedBox(height: 15,),
            SizedBox(
              child: RaisedButton(
                  padding: height > 900 ? EdgeInsets.symmetric(horizontal: 25, vertical: 16)
                       : EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue,
                  onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.PAGE_SPLASH_SCREEN, (route) => false);
              },
              child: Text('Tentar novamente!', style: TextStyle(
                 fontSize: height > 800 ? height * 0.023 : height * 0.024,
                color: Colors.white,
                fontWeight: FontWeight.w700

              ),)),
            ),
          ],
        ),
      ),
    );
  }
}
