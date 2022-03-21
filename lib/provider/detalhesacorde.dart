
import 'package:flutter/cupertino.dart';
import 'package:ritmosdeviolaoxplus/models/acorde.dart';

class DetalhesAcorde extends ChangeNotifier {

  late Acorde _acordeSelecionado;

  void newAcordeSelecionado(Acorde acorde){
    _acordeSelecionado = acorde;
    notifyListeners();
  }

  get acorde => _acordeSelecionado;

}