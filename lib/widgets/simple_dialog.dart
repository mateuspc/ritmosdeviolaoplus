import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_fonts.dart';

class CustomSimpleDialog extends StatelessWidget {
  final Icon icon;
  final String contentMessageText;
  final String textButton;
  final double heightContentMessage;
  final Function onPressedButton;

  const CustomSimpleDialog({
    required this.icon,
    required this.contentMessageText,
    this.textButton = 'OK',
    required this.heightContentMessage,
    required this.onPressedButton,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double moreSpace = 0;
    if (contentMessageText.length > 60) {
      moreSpace = size.width * 0.03;
    } else if (contentMessageText.length < 30) {
      moreSpace = -(size.width * 0.047);
    }
    double HEIGHTCONTENTMESSAGE = heightContentMessage != null
        ? heightContentMessage
        : (size.width * 0.25) + moreSpace;
    double TAMANHODEFAULTDIALOG = HEIGHTCONTENTMESSAGE + size.width * 0.52;
    var borderRadius = BorderRadius.circular(TAMANHODEFAULTDIALOG * 0.06);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetAnimationCurve: Curves.elasticInOut,
      insetAnimationDuration: Duration(seconds: 2),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Container(
        color: Colors.transparent,
        height: TAMANHODEFAULTDIALOG,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double DIAMETROEMOJICIRCLE = constraints.maxWidth * 0.40;

            return Stack(
              children: [
                Container(
                  height: TAMANHODEFAULTDIALOG,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 1,
                  right: 1,
                  child: Container(
                    height: DIAMETROEMOJICIRCLE,
                    width: DIAMETROEMOJICIRCLE,
                    padding: EdgeInsets.all(constraints.maxWidth * 0.08),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    // child: Image.asset(
                    //   imageEmojiPath,
                    //   filterQuality: FilterQuality.low,
                    // ),
                    child: icon,
                  ),
                ),
                Positioned(
                  top: DIAMETROEMOJICIRCLE,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(
                      constraints.maxWidth * 0.15,
                      0,
                      constraints.maxWidth * 0.15,
                      constraints.maxWidth * 0.05,
                    ),
                    height: HEIGHTCONTENTMESSAGE,
                    child: Text(
                      contentMessageText,
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontFamily: FontsApp.mulishBold,
                          fontSize: constraints.maxWidth * 0.054),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  top: DIAMETROEMOJICIRCLE + HEIGHTCONTENTMESSAGE,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: constraints.maxWidth * 0.17,
                          width: constraints.maxWidth * 0.45,
                          child: ElevatedButton(
                            onPressed: () => onPressedButton(),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange,
                                shape: StadiumBorder(),
                                elevation: 0),
                            child: FittedBox(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: Text(
                                textButton,
                                style: TextStyle(
                                    color: Colors.white,
                                    //fontFamily: FontsApp.montserratBold,
                                    fontSize: constraints.maxWidth * 0.055),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
