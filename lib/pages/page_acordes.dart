import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritmosdeviolaoxplus/data/data_acordes_ukulele.dart';
import 'package:ritmosdeviolaoxplus/data/data_acordes_violao.dart';
import 'package:ritmosdeviolaoxplus/models/acorde.dart';
import 'package:ritmosdeviolaoxplus/stores/user_premium_controller.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import 'package:ritmosdeviolaoxplus/utils/enums.dart';
import 'package:ritmosdeviolaoxplus/widgets/nota_list_tile.dart';

class PageAcordes extends StatefulWidget {

  @override
  _PageAcordesState createState() => _PageAcordesState();
}

class _PageAcordesState extends State<PageAcordes> {

  late List<Acorde> _acordes;

  @override
  void initState() {
    super.initState();
    _acordes = DicionarioAcordesViolao.getAcordesPreviewHome();


  }

  @override
  Widget build(BuildContext context) {

    UserPremiumController userPremiumController = Provider.of<UserPremiumController>(context);

    if(!userPremiumController.temAcesso){
      _acordes.forEach((element) {
        var index = _acordes.indexOf(element);
        if(index > 3){
          element.isLocked = true;
        }
      });
    }
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index){
          return Divider(height: 1);
        },
        itemCount: _acordes.length,
        itemBuilder: (context, index){
          return NotaListTile(acorde: _acordes[index], onTap: (){
            if(_acordes[index].isLocked){
              Navigator.of(context).pushNamed(AppRoutes.PAGE_UPGRADE);
            }else{
              Navigator.of(context).pushNamed(AppRoutes.PAGE_CAMPO_HARMONICO,
                  arguments: _acordes[index]);
            }

          }, tabMode: TabMode.ACORDES);
        }
    );
  }
}
