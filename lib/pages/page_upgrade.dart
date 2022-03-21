import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:ritmosdeviolaoxplus/clips/bottom_wave_clipper.dart';
import 'package:ritmosdeviolaoxplus/provider/produtos.dart';
import 'package:ritmosdeviolaoxplus/stores/user_premium_controller.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';
import 'package:ritmosdeviolaoxplus/translate/l10n.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import 'package:ritmosdeviolaoxplus/utils/enums.dart';
import 'package:ritmosdeviolaoxplus/widgets/elevated_button_custom.dart';
import 'package:ritmosdeviolaoxplus/widgets/leading_app_bar.dart';
import 'package:ritmosdeviolaoxplus/widgets/simple_dialog.dart';
import 'package:ritmosdeviolaoxplus/widgets/termos_politicas.dart';
import 'package:ritmosdeviolaoxplus/widgets/text_buttom_custom.dart';
import 'package:ritmosdeviolaoxplus/widgets/title_app_bar.dart';

class PageUpgrade extends StatefulWidget {
  @override
  _PageUpgradeState createState() => _PageUpgradeState();
}

class _PageUpgradeState extends State<PageUpgrade> {

  TypePlan planSelected = TypePlan.MENSAL;

  @override
  Widget build(BuildContext context) {
    UserPremiumController userPremiumController = Provider.of<UserPremiumController>(context, listen: false);

    Package res = userPremiumController.offerings!.getOffering('oferta_compra_unica_violao_ukulele_app')!.getPackage('\$rc_lifetime')!;
    String title = Platform.isIOS ? res.product.title: res.product.title.substring(0, 22);
    String description = res.product.description;
    String price = res.product.priceString;
    LocalizationsApp locale = LocalizationsApp.of(context);
    print(price);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getToolbarHeight(context),
        title: TitleAppBar(title: "Desbloquear itens"),
        leading: LeadingAppBar(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: getToolbarHeight(context) * 1.5,),
                  ItemOfferWidget(title: locale.lifetime, price: price, isSelected: planSelected == TypePlan.VITALICIO ? true : true,
                      onTap: (){
                        setState(() {
                          planSelected = TypePlan.VITALICIO;
                        });
                      }),
                  SizedBox(height: getToolbarHeight(context) * 0.5,),
                  ElevatedButtonCustom(
                    color: ColorsApp.primary,
                    onPressed: () async {
                      try{
                        PurchaserInfo purchaserInfo = await Purchases.purchasePackage(res);
                        if(purchaserInfo.entitlements.all['all_features']!.isActive){
                          userPremiumController.changeTemAcesso(true);
                          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.PAGE_HOME,
                                  (route) => false);
                        }else{
                          print(purchaserInfo);
                        }
                      }on PlatformException catch(e){
                        print('ERRO: ${e.message} CODE: ${e.code}');
                      }
                    },
                    text: locale.buy,
                    widthButton: size.width * 0.85,),
                  SizedBox(height: getToolbarHeight(context) * 0.2,),
                  TextButtonCustom(
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () async {
                      try {
                        PurchaserInfo restoredInfo = await Purchases.restoreTransactions();
                        if(restoredInfo.entitlements.active.isNotEmpty){
                          showDialog(context: context,
                              builder: (context){
                                return CustomSimpleDialog(
                                    icon:Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: size.width * 0.3,
                                    ),
                                    contentMessageText: locale.restore_successfully,
                                    heightContentMessage: size.width * 0.3,
                                    onPressedButton: (){
                                      userPremiumController.changeTemAcesso(true);
                                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.PAGE_HOME, (route) => false);
                                    });
                              });
                        }else{
                          showDialog(context: context,
                              builder: (context){
                                return CustomSimpleDialog(
                                    icon:Icon(
                                      Icons.info,
                                      color: Colors.grey,
                                      size: size.width * 0.3,
                                    ),
                                    contentMessageText: locale.no_purchase_not_found,
                                    heightContentMessage: size.width * 0.3,
                                    onPressedButton: (){
                                      Navigator.of(context).pop();
                                    });
                              });
                        }
                      } on PlatformException catch (e) {
                        // Error restoring purchases

                      }
                    },
                    textColor: Colors.grey,
                    text: locale.restore_purchases,
                    widthButton: size.width * 0.85,),
                  SizedBox(height: getToolbarHeight(context) * 0.2,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    child: Text(
                      locale.lifetime_plan_description
                      , style: TextStyle(
                        fontSize: getToolbarHeight(context) * 0.3,
                        color: Colors.grey,
                        fontFamily: FontsApp.mulishSemibold
                    ),
                    ),
                  ),
                  TermosEPoliticas(
                    height: size.height,
                    backgroundColor: Colors.transparent,
                    textColor: Colors.blue,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class ItemOfferWidget extends StatelessWidget {

  ItemOfferWidget({
    required this.title,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  });

  final String title;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double widthItemOffer = size.width * 0.38;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 10
        ),
        height: widthItemOffer,
        width: widthItemOffer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: !isSelected ? 0 : 6, color: !isSelected ? Colors.white : Colors.blue),
            color: !isSelected ? Colors.grey[200] : Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title, style: TextStyle(
                fontFamily: FontsApp.mulishSemibold,
                fontSize: getToolbarHeight(context) * 0.35
            ),),
            FittedBox(
              child: Text(price, style: TextStyle(
                  fontSize: getToolbarHeight(context) * 0.36,
                  fontFamily: FontsApp.mulishBold
              ),),
            )
          ],
        ),
      ),
    );
  }
}
