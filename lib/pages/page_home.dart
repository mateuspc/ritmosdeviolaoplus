import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ritmosdeviolaoxplus/pages/page_acordes.dart';
import 'package:ritmosdeviolaoxplus/pages/page_ritmos.dart';
import 'package:ritmosdeviolaoxplus/pages/page_videos.dart';
import 'package:ritmosdeviolaoxplus/provider/produtos.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fontsize.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import 'package:ritmosdeviolaoxplus/utils/enums.dart';
import 'package:ritmosdeviolaoxplus/utils/funcoes_menu.dart';
import 'package:ritmosdeviolaoxplus/widgets/textbutton_toolbar_action.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TabMode _tabMode = TabMode.VIDEOS;

@override
  Widget build(BuildContext context) {

    return _layout(context);

  }

   _layout(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LocalizationsApp locale = LocalizationsApp.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        toolbarHeight: getToolbarHeight(context),
        // backgroundColor: Colors.white,
          title: TitleAppBar(title: locale.app_name,),
       bottom: TabBar(
         labelStyle: TextStyle(
           fontSize: getFontSizeTabs(context),
           color: Colors.white,
         ),
         indicatorColor: Colors.black,
         tabs: [
           Tab(text: "Ritmos",),
           Tab(text: "Acordes",),
           Tab(text: "Vídeos",),
         ],
       ),
       leading: Container(
         height: getToolbarHeight(context),
         width: double.infinity,
         margin: EdgeInsets.only(left: !isTableOrIpad(context) ? size.width * 0.01 : size.width * 0.005),
         child: Image.asset('assets/icon/icone_sf.png',),
       ),
       actions: [
         TextButtonToolbar(
           iconData: Platform.isIOS
               ? Icons.settings
               : Icons.settings,
           iconColorButtonRitmando: Colors.white,
           onPressed: (){
             Navigator.pushNamed(context, AppRoutes.PAGE_MENU);
           },
         )
       ],
      ),
        body: TabBarView(children: [
          PageRitmos(),
          PageAcordes(),
          PageVideos()
        ],
        ),
        floatingActionButton: _tabMode == TabMode.VIDEOS ? SizedBox(
          height: getToolbarHeight(context),
          width: isTableOrIpad(context) ? size.width * 0.3 : getToolbarHeight(context) * 3,
          child: FloatingActionButton.extended(
              elevation: 40,
              backgroundColor: Colors.blue[800],
              onPressed: (){
                abrirLink('https://www.youtube.com/channel/UCsg4MnkZX4iwIjanqZc_JXw');

              }, label: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text("QUERO MAIS", style: TextStyle(
                color: Colors.white,
                fontFamily: FontsApp.mulishBold,
                fontWeight: FontWeight.bold,
                fontSize: getToolbarHeight(context) * 0.3

            ),),
          )),
        ) : null,
  ),
    );
  }



}




