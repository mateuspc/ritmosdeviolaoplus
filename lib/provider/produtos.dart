import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class Produtos extends ChangeNotifier {

  late PurchaserInfo purchaserInfo;
  late Offerings offerings;
  late String erroCode;
  bool temDireito = false;

  Future<void> requestOffersAndPurchases() async {
    erroCode = "";
    try{
      await Purchases.setDebugLogsEnabled(true);
      await Purchases.setup(Platform.isIOS ? "aJrTjXkcEBlcOmkdADoukIHoXfwvRWkx" : 'auDBkAcFMxhtFQvVaHQskDZyMqyeQPbr');
      PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();
      Offerings offerings = await Purchases.getOfferings();
      this.offerings = offerings;
      this.purchaserInfo = purchaserInfo;
      print("Purchase info: $purchaserInfo ");
      temDireito =  purchaserInfo.entitlements.all['all_features']!.isActive;
      print("Tem direito: $temDireito ");
      changeTemDireito(temDireito);
      erroCode = "";
      notifyListeners();
      print('nao caiu no catch $temDireito');
    }on PlatformException catch(e){
      erroCode = 'error';
      print('catch PlatformException');
    } catch(error){
      print(error);
      erroCode = 'error';
      print('catch error');
    }
  }

  void changeTemDireito(bool value){
    this.temDireito = value;
    notifyListeners();
  }
}