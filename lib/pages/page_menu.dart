import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:ritmosdeviolaoxplus/models/page_site.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import 'package:ritmosdeviolaoxplus/utils/funcoes_menu.dart';
import 'package:ritmosdeviolaoxplus/widgets/list_tile_custom.dart';
import 'package:ritmosdeviolaoxplus/widgets/leading_app_bar.dart';
import 'package:ritmosdeviolaoxplus/widgets/sobre_dialog.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';

class PageMenu extends StatefulWidget {
  @override
  _PageMenuState createState() => _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  @override
  Widget build(BuildContext context) {



    return _layout(context);

  }

  _layout(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    LocalizationsApp locale = LocalizationsApp.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getToolbarHeight(context),
        title: TitleAppBar(title: locale.options),
        leading: LeadingAppBar(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Divider(height: 1),
          ListTileCustom(
            title: locale.share_with_friend,
            iconData: Platform.isIOS? CupertinoIcons.share : Icons.share,
            onTap: (){
              shareThisAppWithFriends();
            }, height: size.height,
          ),
          Divider(height: 1, thickness: 1),
          ListTileCustom(
            title: locale.team_contact,
            iconData: CupertinoIcons.mail, height: size.height,
            onTap: (){
              enviarEmailParaEquipe();
            },
          ),
          Divider(height: 1, thickness: 1),
          ListTileCustom(
            title: locale.other_apps,
            iconData: Icons.apps, height: size.height,
            onTap: (){
              abrirLink(Platform.isIOS ? 'https://apps.apple.com/us/developer/mateus-cardoso/id1530866903':
                  'https://play.google.com/store/apps/dev?id=8327589753125275908');
            },
          ),
          Divider(height: 1, thickness: 1),
          ListTileCustom(
            title: locale.privacy_policy,
            iconData: Icons.lock, height: size.height,
            onTap: (){
              var pageSiteInfo = PageSiteInfo.politicaPrivacidade();
              Navigator.pushNamed(context, AppRoutes.PAGE_SITE_INFO, arguments: pageSiteInfo.toMap());
            },
          ),
          Divider(height: 1, thickness: 1),
          ListTileCustom(
            title: locale.terms_of_use,
            iconData: Icons.import_contacts, height: size.height,
            onTap: (){
              var pageSiteInfo = PageSiteInfo.termosUso();
              Navigator.pushNamed(context, AppRoutes.PAGE_SITE_INFO, arguments: pageSiteInfo.toMap());
            },
          ),
        ],
      ),
    );
  }
}
