import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/models/page_site.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';


class TermosEPoliticas extends StatelessWidget {
  const TermosEPoliticas({
    Key? key,
    required this.height,
    this.bottomBorderSize = 15,
    required this.backgroundColor,
    this.textColor = Colors.grey
  }) : super(key: key);

  final double height;
  final double bottomBorderSize;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {

    LocalizationsApp locale = LocalizationsApp.of(context);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(bottomBorderSize), bottomRight: Radius.circular(bottomBorderSize)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
                var pageSiteInfo = PageSiteInfo.politicaPrivacidade();
                Navigator.pushNamed(context, AppRoutes.PAGE_SITE_INFO, arguments: pageSiteInfo.toMap());

              },
              child: FittedBox(
                child: Text(locale.privacy_policy, style: TextStyle(
                    color: textColor,
                    fontSize: height < 740 ? height * 0.021 : height * 0.015,
                    fontFamily: FontsApp.mulishSemibold
                ),),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              '.',
              style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w800
              ),
            ),
          ),
          Expanded(
            child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
                var pageSiteInfo = PageSiteInfo.termosUso();
                Navigator.pushNamed(context, AppRoutes.PAGE_SITE_INFO, arguments: pageSiteInfo.toMap());
              },
              child: FittedBox(
                child: Text(locale.terms_of_use, style: TextStyle(
                    color: textColor,
                    fontSize: height < 740 ? height * 0.021 : height * 0.015,
                    fontFamily: FontsApp.mulishSemibold
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
