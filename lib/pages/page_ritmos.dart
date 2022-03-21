import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ritmosdeviolaoxplus/models/categoria.dart';
import 'package:ritmosdeviolaoxplus/data/ritmos_data.dart';
import 'package:ritmosdeviolaoxplus/models/ritmo.dart';
import 'package:ritmosdeviolaoxplus/stores/user_premium_controller.dart';
import 'package:ritmosdeviolaoxplus/styles/app_dimens.dart';
import 'package:ritmosdeviolaoxplus/styles/app_iconsize.dart';
import 'package:ritmosdeviolaoxplus/utils/app_routes.dart';
import '../shapes/draw_arrow.dart';

class PageRitmos extends StatefulWidget {

  PageRitmos();

  @override
  _PageRitmosState createState() => _PageRitmosState();
}

class _PageRitmosState extends State<PageRitmos> {
  late List<Ritmo> _ritmos;


  @override
  void initState() {
    super.initState();
    _ritmos = RitmosData.getAllRitmos();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return _body(width, height);
  }

  _body(double width, double height) {
    UserPremiumController userPremiumController = Provider.of<UserPremiumController>(context);

    if(!userPremiumController.temAcesso){
      _ritmos.forEach((element) {
        var index = _ritmos.indexOf(element);
        if(index > 7){
          element.isLocked = true;
        }
      });
    }

    return ListView.separated(
        itemCount: _ritmos.length,
        separatorBuilder: (context, index){
          return Divider(height: 1);
        },
        itemBuilder: (context, index) {

          double heightListTileRitmo = getListTileRitmoHeight(context);
          double paddingHorizontal = heightListTileRitmo * 0.05;
          double paddingVertical = heightListTileRitmo * 0;

          return GestureDetector(
            onTap: (){
              if(_ritmos[index].isLocked)
                Navigator.pushNamed(context, AppRoutes.PAGE_UPGRADE);
              else Navigator.pushNamed(context, AppRoutes.PAGE_DETAILS, arguments: _ritmos[index]);
            },
            child: Container(
              height: heightListTileRitmo,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
              child: LayoutBuilder(builder: (context, constraints){
                 return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('Levada #${index + 1}', style: TextStyle(
                               fontSize: constraints.maxHeight * 0.1,
                               fontWeight: FontWeight.bold
                           ),),
                           Spacer(),
                           if(_ritmos[index].isLocked)
                             FaIcon(FontAwesomeIcons.lock, size: getIconSize(context))
                         ],
                       ),
                     ),
                     Center(
                       child: Container(
                         child: FittedBox(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: _ritmos[index]
                                 .arrows
                                 .map(
                                   (e) => CustomPaint(
                                 painter: DrawArrow(
                                     mascada: e.mascada,
                                     down: e.down,
                                     color: e.color,
                                     mascadaColor: e.mascadaColor,
                                     borderColor: e.borderColor,
                                     borderStrokeWidthFraction: e.borderStrokeWidthFraction,
                                     backgroundColor: e.backgroundColor),
                                 child: Container(
                                   width: constraints.maxHeight * 0.2,
                                   height: constraints.maxHeight * 0.35,
                                 ),
                               ),
                             ).toList(),
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.centerRight,
                       child: Wrap(
                         spacing: 10,
                         runSpacing: 10,
                         crossAxisAlignment: WrapCrossAlignment.end,
                         alignment: WrapAlignment.end,
                         children: buildCategoriaRitmo(_ritmos[index].categorias as List<Categoria>, height),
                       ),
                     ),
                     Container(
                       height: constraints.maxHeight * 0.01
                        // child: SizedBox(height: constraints.maxHeight * 0.01)
                     ),
                     Container(
                       height: constraints.maxHeight * 0.13,
                       width: constraints.maxWidth,
                       alignment: Alignment.centerLeft,
                       child: FittedBox(
                         child: Text('${_ritmos[index].feitoPor.contains('Thayna') ? 'Professora:' : 'Instrutor:'} ${_ritmos[index].feitoPor}', style: TextStyle(
                             fontStyle: FontStyle.italic,
                             fontSize: constraints.maxHeight * 0.1,
                             color: Colors.grey[400]
                         ),),
                       ),
                     )
                   ],
                 );
              }),
            ),
          );
        });
  }

  List<Widget> buildCategoriaRitmo(List<Categoria> categorias, double height) {
    return categorias.map((e) => Container(
      decoration: BoxDecoration(
          color: e.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: e.borderColor, width: 1 )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(e.nome, style: TextStyle(
            color: e.textColor,
            fontWeight: FontWeight.w700,
            fontSize: height > 800 ? height * 0.02 : height * 0.022
        ),),
      ),
    )).toList();

  }
}
