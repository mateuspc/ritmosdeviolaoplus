import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/models/page_site.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/widgets/leading_app_bar.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageSite extends StatefulWidget {

  @override
  _PageSiteState createState() => _PageSiteState();
}

class _PageSiteState extends State<PageSite> {

  int _stackIndex = 1;
  var pageSiteMap = Map();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    pageSiteMap = ModalRoute.of(context)!.settings.arguments as Map;

      if(pageSiteMap.containsKey('data')){
        var lista =  pageSiteMap['data']['pageSiteInfo'].toString().split('\"');
        if(pageSiteMap['pageSiteInfo']['urlSite'].toString().contains('\\')) {
          pageSiteMap = PageSiteInfo(titlePage: lista[3],
              urlSite: lista[7].replaceAll('\\', '').trim()).toMap();
        }
      }else if(Platform.isIOS){
        var lista =  pageSiteMap['pageSiteInfo'].toString().split('\"');
        if(pageSiteMap['pageSiteInfo']['urlSite'].toString().contains('\\')){
          pageSiteMap = PageSiteInfo(titlePage: lista[3], urlSite: lista[7].replaceAll('\\', '').trim()).toMap();
        }
      }


    return  Scaffold(
       appBar: AppBar(
         toolbarHeight: getToolbarHeight(context),
         title: TitleAppBar(title: '${pageSiteMap['pageSiteInfo']['titlePage']}',),
         leading: LeadingAppBar(onPressed: (){
           Navigator.of(context).pop();
         },
         iconData: Icons.close,),
       ),
       body: _webView(),
     );
  }

  _webView() {
    return IndexedStack(
      index: _stackIndex,
      children: [
        Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: pageSiteMap['pageSiteInfo']['urlSite'].toString().replaceAll('\\',''),
                onPageFinished: _onPageFinished,
              ),
            )
          ],
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

 void _onPageFinished(String url){
    setState(() {
      _stackIndex = 0;
    });
 }
}
