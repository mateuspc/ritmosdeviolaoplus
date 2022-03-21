import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ritmosdeviolaoxplus/models/acorde.dart';
import 'package:ritmosdeviolaoxplus/models/division.dart';
import 'package:ritmosdeviolaoxplus/models/arrow.dart';
import 'package:ritmosdeviolaoxplus/models/musica.dart';
import 'package:ritmosdeviolaoxplus/models/categoria.dart';
import 'package:ritmosdeviolaoxplus/provider/acordes.dart';

class Ritmo{
  String? titulo;
  String apelido;
  Color colorRitmo;
  List<Arrow> arrows;
  List<Division> divisionsRitmo;
  List<Musica> musicas;
  List<Categoria> categorias;
  String? acordesUtilizadosGravacao;
  List<int> timesShowAcordeInVideoInSeconds;
  List<Acorde> acordesToShowSobreVideoOrderTime;
  String videoId;
  String? pathAudio;
  int? prioridade;
  bool isLocked;
  String videoViolaoId;
  String feitoPor;

  Ritmo({
    this.titulo,
    this.pathAudio,
    required this.colorRitmo,
    required this.apelido,
    required this.arrows,
    required this.divisionsRitmo,
    required this.musicas,
    required this.categorias,
    this.acordesUtilizadosGravacao,
    required this.timesShowAcordeInVideoInSeconds,
    required this.acordesToShowSobreVideoOrderTime,
    required this.videoId,
    required this.videoViolaoId,
    this.prioridade,
    required this.feitoPor,
    this.isLocked = false});

}