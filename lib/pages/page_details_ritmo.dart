import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ritmosdeviolaoxplus/models/division.dart';
import 'package:ritmosdeviolaoxplus/models/ritmo.dart';
import 'package:ritmosdeviolaoxplus/provider/acordes.dart';
import 'package:ritmosdeviolaoxplus/shapes/custom_list_type_indicator.dart';
import 'package:ritmosdeviolaoxplus/shapes/divisions_one_arrow_shape.dart';
import 'package:ritmosdeviolaoxplus/shapes/divisions_two_arrows_shape.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/utils/funcoes_menu.dart';
import 'package:ritmosdeviolaoxplus/widgets/leading_app_bar.dart';
import 'package:ritmosdeviolaoxplus/widgets/textbutton_toolbar_action.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PageDetails extends StatefulWidget {

  PageDetails();

  @override
  _PageDetailsState createState() => _PageDetailsState();
}


class _PageDetailsState extends State<PageDetails> with WidgetsBindingObserver{

   bool isPlaying = false;
  late YoutubePlayerController _controller;
  late Ritmo _ritmo;
  int positionAnterior = -2;

   Duration youtubePlayerValue = YoutubePlayerValue().position;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _ritmo = ModalRoute.of(context)!.settings.arguments as Ritmo;
    _controller = YoutubePlayerController(
      initialVideoId: _ritmo.videoViolaoId.isEmpty ? _ritmo.videoId : _ritmo.videoViolaoId,
        flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
    ),);


  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    switch(state){
      case AppLifecycleState.paused:
        _controller.pause();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        if(_controller.value.position.inSeconds > 0 && isPlaying){
          _controller.play();
          isPlaying = true;
        }
        break;
      case AppLifecycleState.inactive:
        break;
      default:
        break;
    }
    print(state);
  }
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);


   }
  //  void showAd() async{
  //      myInterstitial.show().then((value){
  //        Navigator.pushReplacementNamed(context, AppRoutes.PAGE_HOME);
  //      });
  //  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var appBarSize = (size.height > 900 ? size.height * 0.06
        : size.height * 0.07) + MediaQuery.of(context).viewPadding.top;

    final providerAcordes = Provider.of<Acordes>(context, listen: false);

    return _layout(size, providerAcordes, appBarSize);
  }

  _layout(Size size, Acordes providerAcordes, double appBarSize) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
          appBar: AppBar(
            toolbarHeight: getToolbarHeight(context),
            leading: LeadingAppBar(onPressed: (){
             // showAd();
              Navigator.pop(context);
            }),
            title: TitleAppBar(title: _ritmo.apelido),
            actions: [
              TextButtonToolbar(
                  onPressed: (){
                    abrirLink('https://www.youtube.com/channel/UCsg4MnkZX4iwIjanqZc_JXw');
                  },
                  iconData: FontAwesomeIcons.youtube,
                  iconColorButtonRitmando: Colors.red,
                  text: 'RITMANDO')
            ],
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Card(
                    elevation: 0,
                    color: Colors.grey[300],
                    child: Container(
                      padding:  EdgeInsets.zero,
                      child: ListView(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              YoutubePlayer(
                                controller: _controller,
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(isExpanded: true, colors: ProgressBarColors(
                                      playedColor: Colors.amber,
                                      handleColor: Colors.amberAccent
                                  ),),
                                ],
                                onReady: (){
                                  _controller.addListener(() {
                                    int positionInSeconds = _controller.value.position.inSeconds;

                                    if(positionAnterior != positionInSeconds){
                                      positionAnterior = positionInSeconds;
                                      _ritmo.timesShowAcordeInVideoInSeconds.forEach((element) {
                                        try{
                                          int index = _ritmo.timesShowAcordeInVideoInSeconds.indexOf(element);
                                          if(positionInSeconds >= element && positionInSeconds < _ritmo.timesShowAcordeInVideoInSeconds.elementAt(index + 1)){
                                            providerAcordes.newAcorde(_ritmo.acordesToShowSobreVideoOrderTime[index]);
                                          }else if(positionInSeconds == 0){
                                            providerAcordes.setVisibility(false);
                                          }
                                        }catch(e){

                                        }
                                      });
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.04),
                          Wrap(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    _getDivisionsWithSpace(_ritmo.divisionsRitmo as List<Division>, size),
                                  ),
                                ],
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                  child: Row(
                                    children: [
                                      FittedBox(
                                        child: Text('Dicas de músicas:',
                                          style: TextStyle(
                                              fontSize: getToolbarHeight(context) * 0.4,
                                              fontFamily: FontsApp.mulishBold,
                                              color: Colors.black
                                          ),),
                                      ),
                                    ],
                                  ), onPressed: (){}),
                            ],
                          ),
                          Container(
                            child: SingleChildScrollView(
                               physics: NeverScrollableScrollPhysics(),
                               child: Column(
                                  children: [
                                    ..._ritmo.musicas.map((e) => Container(
                                      child: Container(
                                        height: getToolbarHeight(context) * 1.1,
                                        child: LayoutBuilder(
                                          builder: (context, constraints){
                                            return Row(
                                              children: [
                                                CustomPaint(
                                                  size: Size(constraints.maxHeight * 0.5,
                                                      constraints.maxHeight * 0.5),
                                                  painter: ListTypeCustom(text: '♫'),
                                                ),
                                                SizedBox(width: constraints.maxHeight * 0.1),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: constraints.maxWidth * 0.9,
                                                      height: constraints.maxHeight * 0.6,
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(e.nome, style: TextStyle(
                                                          fontSize: constraints.maxHeight * 0.3,
                                                          fontWeight: FontWeight.w600
                                                      ),
                                                        overflow: TextOverflow.ellipsis,),
                                                    ),
                                                    Container(
                                                        height: constraints.maxHeight * 0.3,
                                                        child: Text("(${e.autor})", style: TextStyle(
                                                          fontSize: constraints.maxHeight * 0.25
                                                        ),)
                                                    ),
                                                    Divider(height: constraints.maxHeight * 0.1)
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ))
                                  ],
                                )

                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),

            ],
          )
        );
  }


  buildOneArrow(Division d2, Size size) {
    return CustomPaint(
      size: Size((size.height * 0.16865) * 0.2, (size.height * 0.4) * 0.2),
      painter: DivisiosOneArrow(
          textPasso: d2.textPasso,
          arrowOneMascada: d2.arrowOneMascada,
          arrowOneDown: d2.arrowOneDown,
          textPassoColor: d2.textPassoColor,
          backgroundColor: d2.backgroundColor,
          mascadaColor: d2.mascadaColor,
          lineBaseColor: d2.lineBaseColor),
    );
  }

  buildTwoArrow(Division d1, Size size) {
    return CustomPaint(
      size: Size((size.height * 0.33733) * 0.2, (size.height * 0.4) * 0.2),
      painter: DivisionsTwoArrowsShape(
          textPasso: d1.textPasso,
          textPassoColor: d1.textPassoColor,
          arrowOneDown: d1.arrowOneDown,
          arrowTwoDown: d1.arrowTwoDown,
          arrowOneMascada: d1.arrowOneMascada,
          arrowTwoMascada: d1.arrowTwoMascada,
          mascadaColor: d1.mascadaColor,
          backgroundColor: d1.backgroundColor,
          lineBaseColor: d1.lineBaseColor),
    );
  }

  List<Widget> _getDivisionsWidgets(List<Division> divisions, Size size) {
    return divisions.map<Widget>((e) {
      if (e.quantidadeArrows == 2) {
        return buildTwoArrow(e, size);
      } else {
        return buildOneArrow(e, size);
      }
    }).toList();
  }

  List<Widget> _getDivisionsWithSpace(List<Division> divisions, Size size) {
    List<Widget> list = _getDivisionsWidgets(divisions, size);
    for (int i = 0; i < list.length; i++) {
      if (i % 2 == 1) {
        list.insert(i, SizedBox(width: (size.height * 0.02999) * 0.5));
      }
    }
    return list;
  }


}
