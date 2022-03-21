import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ritmosdeviolaoxplus/pages/page_campo_harmonico.dart';
import 'package:ritmosdeviolaoxplus/pages/page_details_ritmo.dart';
import 'package:ritmosdeviolaoxplus/pages/page_details_acorde.dart';
import 'package:ritmosdeviolaoxplus/pages/page_home.dart';
import 'package:ritmosdeviolaoxplus/pages/page_menu.dart';
import 'package:ritmosdeviolaoxplus/pages/page_network.dart';
import 'package:ritmosdeviolaoxplus/pages/page_site.dart';
import 'package:ritmosdeviolaoxplus/pages/page_splash.dart';
import 'package:ritmosdeviolaoxplus/pages/page_upgrade.dart';
import 'package:ritmosdeviolaoxplus/provider/acordes.dart';
import 'package:ritmosdeviolaoxplus/provider/detalhesacorde.dart';
import 'package:ritmosdeviolaoxplus/provider/produtos.dart';
import 'package:ritmosdeviolaoxplus/stores/user_premium_controller.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final temaPadrao = ThemeData(
    primaryColor: ColorsApp.primary,
    fontFamily: FontsApp.mulishRegular,
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white, fontSize: 10),
            button: TextStyle(color: Colors.white))
    ));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Show tracking authorization dialog and ask for permission


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
      MultiProvider(
            providers: [
              ChangeNotifierProvider( create: (_) => Produtos(),),
              ChangeNotifierProvider( create: (_) => Acordes(),),
              ChangeNotifierProvider( create: (_) => DetalhesAcorde(),),
              Provider(create: (_) => UserPremiumController())
            ],
            child: MaterialApp(
              theme: temaPadrao,
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.PAGE_SPLASH_SCREEN,
              locale: Locale('pt'),
              localizationsDelegates: [
                LocalizationsApp.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (locale, f){
                return locale;
              },
              routes: {
                AppRoutes.PAGE_HOME: (_) => Dashboard(),
                AppRoutes.PAGE_NETWORK: (_) => PageInternetNotAvaliable(),
                AppRoutes.PAGE_MENU: (_) => PageMenu(),
                AppRoutes.PAGE_SITE_INFO: (_) => PageSite(),
                AppRoutes.PAGE_DETAILS: (_) => PageDetails(),
                AppRoutes.PAGE_CAMPO_HARMONICO: (_) => PageCampoHarmonico(),
                AppRoutes.PAGE_DETAILS_ACORDE: (_) => PageDetailsAcorde(),
                AppRoutes.PAGE_SPLASH_SCREEN: (_) => SplashScreen(),
                AppRoutes.PAGE_UPGRADE: (_) => PageUpgrade(),
              },
            ),
          )));
}
