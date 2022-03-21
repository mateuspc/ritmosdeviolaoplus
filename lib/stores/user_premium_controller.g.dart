// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_premium_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserPremiumController on UserPremiumControllerBase, Store {
  final _$temAcessoAtom = Atom(name: 'UserPremiumControllerBase.temAcesso');

  @override
  bool get temAcesso {
    _$temAcessoAtom.reportRead();
    return super.temAcesso;
  }

  @override
  set temAcesso(bool value) {
    _$temAcessoAtom.reportWrite(value, super.temAcesso, () {
      super.temAcesso = value;
    });
  }

  final _$offeringsAtom = Atom(name: 'UserPremiumControllerBase.offerings');

  @override
  purchase.Offerings? get offerings {
    _$offeringsAtom.reportRead();
    return super.offerings;
  }

  @override
  set offerings(purchase.Offerings? value) {
    _$offeringsAtom.reportWrite(value, super.offerings, () {
      super.offerings = value;
    });
  }

  final _$purchaserInfoAtom =
      Atom(name: 'UserPremiumControllerBase.purchaserInfo');

  @override
  purchase.PurchaserInfo? get purchaserInfo {
    _$purchaserInfoAtom.reportRead();
    return super.purchaserInfo;
  }

  @override
  set purchaserInfo(purchase.PurchaserInfo? value) {
    _$purchaserInfoAtom.reportWrite(value, super.purchaserInfo, () {
      super.purchaserInfo = value;
    });
  }

  final _$erroCodeAtom = Atom(name: 'UserPremiumControllerBase.erroCode');

  @override
  String get erroCode {
    _$erroCodeAtom.reportRead();
    return super.erroCode;
  }

  @override
  set erroCode(String value) {
    _$erroCodeAtom.reportWrite(value, super.erroCode, () {
      super.erroCode = value;
    });
  }

  @override
  ObservableFuture<void> requestOffersAndPurchases() {
    final _$future = super.requestOffersAndPurchases();
    return ObservableFuture<void>(_$future);
  }

  final _$UserPremiumControllerBaseActionController =
      ActionController(name: 'UserPremiumControllerBase');

  @override
  void changeTemAcesso(bool value) {
    final _$actionInfo = _$UserPremiumControllerBaseActionController
        .startAction(name: 'UserPremiumControllerBase.changeTemAcesso');
    try {
      return super.changeTemAcesso(value);
    } finally {
      _$UserPremiumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chanagePurchaseOfferings(purchase.Offerings offerings) {
    final _$actionInfo =
        _$UserPremiumControllerBaseActionController.startAction(
            name: 'UserPremiumControllerBase.chanagePurchaseOfferings');
    try {
      return super.chanagePurchaseOfferings(offerings);
    } finally {
      _$UserPremiumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePurchaseInfo(purchase.PurchaserInfo purchaserInfo) {
    final _$actionInfo = _$UserPremiumControllerBaseActionController
        .startAction(name: 'UserPremiumControllerBase.changePurchaseInfo');
    try {
      return super.changePurchaseInfo(purchaserInfo);
    } finally {
      _$UserPremiumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErroCode(String value) {
    final _$actionInfo = _$UserPremiumControllerBaseActionController
        .startAction(name: 'UserPremiumControllerBase.changeErroCode');
    try {
      return super.changeErroCode(value);
    } finally {
      _$UserPremiumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
temAcesso: ${temAcesso},
offerings: ${offerings},
purchaserInfo: ${purchaserInfo},
erroCode: ${erroCode}
    ''';
  }
}
