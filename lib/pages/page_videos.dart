import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/utils/funcoes_menu.dart';

class PageVideos extends StatelessWidget {
  const PageVideos({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          InkWell(
            onTap: (){
              abrirLink("https://youtu.be/YIZAFwi25p8");
            },
            child: Stack(
              children: [
                Card(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.white,
                    child: Image.asset("assets/capas_videos/capa_01.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: getToolbarHeight(context) * 1.2,
                        width: getToolbarHeight(context) * 1.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200]
                        ),
                        child: Icon(FontAwesomeIcons.play, size: getToolbarHeight(context) * 0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
             abrirLink("https://youtu.be/Hh_cSeaGbbQ");
            },
            child: Stack(
              children: [
                Card(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.white,
                    child: Image.asset("assets/capas_videos/capa_04.png", fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: getToolbarHeight(context) * 1.2,
                        width: getToolbarHeight(context) * 1.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200]
                        ),
                        child: Icon(FontAwesomeIcons.play, size: getToolbarHeight(context) * 0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
             abrirLink("https://youtu.be/zrIY4JlC6v8");
            },
            child: Stack(
              children: [
                Card(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.white,
                    child: Image.asset("assets/capas_videos/capa_02.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: getToolbarHeight(context) * 1.2,
                        width: getToolbarHeight(context) * 1.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200]
                        ),
                        child: Icon(FontAwesomeIcons.play, size: getToolbarHeight(context) * 0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
             abrirLink("https://youtu.be/u0OIUKlaFYQ");
            },
            child: Stack(
              children: [
                Card(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.white,
                    child: Image.asset("assets/capas_videos/capa_03.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: isTableOrIpad(context) ? getToolbarHeight(context) * 6 : getToolbarHeight(context) * 4,
                    width: size.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: getToolbarHeight(context) * 1.2,
                        width: getToolbarHeight(context) * 1.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200]
                        ),
                        child: Icon(FontAwesomeIcons.play, size: getToolbarHeight(context) * 0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
