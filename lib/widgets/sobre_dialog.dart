import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/widgets/termos_politicas.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/app_colors.dart';

class MySobreDialog extends StatefulWidget {

  final PackageInfo packageInfo;

  MySobreDialog(this.packageInfo);

  @override
  _MySobreDialogState createState() => _MySobreDialogState();
}

class _MySobreDialogState extends State<MySobreDialog> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
  
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    LocalizationsApp locale = LocalizationsApp.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.2),
      insetAnimationCurve: Curves.elasticInOut,
      insetAnimationDuration: Duration(
          seconds: 2
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: ColorsApp.primary
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.14,
                            width: height * 0.2,
                            child: Image.asset('assets/icon/icone_sf.png'),
                          ),
                          FittedBox(
                            child: Text(locale.app_name, style: TextStyle(
                                fontSize: height * 0.04,
                                fontWeight: FontWeight.w800,
                                color: Colors.white
                            ),),
                          ),
                          FittedBox(
                            child: CupertinoButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  showLicensePage(context: context,
                                      applicationVersion: widget.packageInfo.version,
                                      applicationName: widget.packageInfo.appName,
                                      applicationIcon: Container(
                                          height: height * 0.14,
                                          width: height * 0.2,
                                          child: Image.asset('assets/icon/icone_sf.png')
                                      )
                                  );
                                },
                                child: Text('Licenças', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.02
                                ),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                      top: 5,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsApp.primary,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10))
                          ),
                          child: Icon(
                            CupertinoIcons.clear_thick,
                            color: Colors.black87,
                            size: height * 0.07,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text('Autor: Mateus Polonini Cardoso',
                                style: TextStyle(
                                    fontSize: height < 740 ? height * 0.03 : height * 0.02
                                ),),
                            ),
                          ),
                          SizedBox(height: height * 0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.instagram, size: height * 0.04),
                                color: Colors.red,
                                onPressed: () async{
                                  const url = 'https://www.instagram.com/mateus.cardoso.h/';
                                  _launchSocialMedia(url);
                                },
                              ),
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebook, size: height * 0.04),
                                color: Colors.blue,
                                highlightColor: Colors.black,
                                onPressed: (){
                                  const url = 'https://www.facebook.com/mateus.cardosow/';
                                  _launchSocialMedia(url);
                                },
                              ),
                              IconButton(
                                icon: FaIcon(FontAwesomeIcons.youtube, size: height * 0.04),
                                color: Colors.red,
                                onPressed: (){
                                  const url = 'https://www.youtube.com/channel/UCsg4MnkZX4iwIjanqZc_JXw';
                                  _launchSocialMedia(url);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    TermosEPoliticas(height: height,
                      textColor: Colors.blue,
                      backgroundColor: Colors.transparent,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _launchSocialMedia(String url) async{
    Navigator.of(context).pop();
    if (await canLaunch(url)) {
    await launch(url, universalLinksOnly: true);
    } else {
    throw 'Could not launch $url';
    }
  }
}

