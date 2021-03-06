import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/shapes/acorde_ukulele_shape.dart';
import 'package:ritmosdeviolaoxplus/shapes/acorde_violao_shape.dart';
import 'package:ritmosdeviolaoxplus/widgets/leading_app_bar.dart';
import 'package:ritmosdeviolaoxplus/models/acorde.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PageDetailsAcorde extends StatefulWidget {
  bool typeBanner;
  List<Acorde>? acordes;

  PageDetailsAcorde({this.typeBanner = false, this.acordes});

  @override
  _PageDetailsAcordeState createState() => _PageDetailsAcordeState();
}

class _PageDetailsAcordeState extends State<PageDetailsAcorde> {
  late YoutubePlayerController _controller;
  late Acorde _acorde;

  Widget getShape(Acorde acorde){
        return Hero(
          tag: 'acorde',
          child: CustomPaint(
            painter: DesenharAcordeViolao(
                backgroundShapeColor: Colors.transparent,
                acorde: acorde),
            child: Container(),
          ),
        );

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _acorde = ModalRoute.of(context)!.settings.arguments as Acorde;

    double height = MediaQuery.of(context).size.height;

  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getToolbarHeight(context),
        title: TitleAppBar(title: _acorde.nome),
        leading: LeadingAppBar(onPressed: (){
          Navigator.of(context).pop();
        },),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: size.width * 0.9,
                  width: size.width * 0.7,
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: getShape(_acorde),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



}
