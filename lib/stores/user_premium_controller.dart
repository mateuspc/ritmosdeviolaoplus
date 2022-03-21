import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:purchases_flutter/purchases_flutter.dart' as purchase;
part 'user_premium_controller.g.dart';

class UserPremiumController = UserPremiumControllerBase with _$UserPremiumController;

abstract class UserPremiumControllerBase with Store {

  @observable
  bool temAcesso = false;

  @action
  void changeTemAcesso(bool value){
    this.temAcesso = value;
  }

  @observable
  purchase.Offerings? offerings;

  @action
  void chanagePurchaseOfferings(purchase.Offerings offerings){
    this.offerings = offerings;
  }

  @observable
  purchase.PurchaserInfo? purchaserInfo;

  @action
  void changePurchaseInfo(purchase.PurchaserInfo purchaserInfo){
    this.purchaserInfo = purchaserInfo;
  }

  @observable
  String erroCode = "";

  @action
  void changeErroCode(String value){
    this.erroCode = value;
  }

  @observable
  Future<void> requestOffersAndPurchases() async {
    erroCode = "";
    try{
      await purchase.Purchases.setDebugLogsEnabled(false);
      await purchase.Purchases.setup(Platform.isIOS ? "aJrTjXkcEBlcOmkdADoukIHoXfwvRWkx" : 'auDBkAcFMxhtFQvVaHQskDZyMqyeQPbr');
      purchase.PurchaserInfo purchaserInfo = await purchase.Purchases.getPurchaserInfo();
      purchase.Offerings offerings = await purchase.Purchases.getOfferings();
      this.offerings = offerings;
      this.purchaserInfo = purchaserInfo;
      print("Purchase info: $purchaserInfo ");
      var temAcesso =  purchaserInfo.entitlements.all['all_features']!.isActive;
      print("Tem direito: $temAcesso ");
      changeTemAcesso(temAcesso);
      erroCode = "";
    }on PlatformException catch(e){
      erroCode = 'error';
      print('catch PlatformException');
    } catch(error){
      print(error);
      erroCode = 'error';
      print('catch error');
    }
  }
}