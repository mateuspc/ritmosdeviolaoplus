import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritmosdeviolaoxplus/provider/produtos.dart';
import 'package:ritmosdeviolaoxplus/stores/user_premium_controller.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var userPremiumController = Provider.of<UserPremiumController>(context, listen: false);

    userPremiumController.requestOffersAndPurchases().then((value) {
       if(userPremiumController.erroCode.isNotEmpty){
         Navigator.pushNamed(context, AppRoutes.PAGE_NETWORK);
       }
       try{
         if(userPremiumController.purchaserInfo!.entitlements.all['all_features']!.isActive){
           Navigator.pushReplacementNamed(context, AppRoutes.PAGE_HOME);
         }else{
           Navigator.pushNamed(context, AppRoutes.PAGE_NETWORK);
         }
       }catch(e){
         print('Caiu no catch');
         Navigator.pushNamed(context, AppRoutes.PAGE_HOME);
       }

    });
  }



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                   height: height > 900 ? width * 0.2 : width * 0.25,
                    width: height > 900 ? width * 0.2 : width * 0.25,
                   child: Image.asset('assets/icon/icone_sf.png')),
            Text(
              'Carregando...',
              style: TextStyle(fontSize: height > 900 ? width * 0.048 : width * 0.06, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

}
