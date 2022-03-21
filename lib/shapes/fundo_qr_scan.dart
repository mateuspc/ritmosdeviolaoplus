import 'package:flutter/material.dart';
import 'package:ritmosdeviolaoxplus/styles/app_colors.dart';

class FundoQRCodeScan extends CustomPainter{

  final Color background;
  final Color corBordas;

  FundoQRCodeScan({this.background = Colors.black45, this.corBordas = corPadrao});
  @override

  void paint(Canvas canvas, Size size) {

    var paint = Paint();
    paint.color = Colors.transparent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    paint.strokeWidth = 10;
    paint.color = Colors.black45;
    paint.style = PaintingStyle.fill;
    var rect1 = Rect.fromLTWH(0, 0, size.width, size.height * 0.2);
    canvas.drawRect(rect1, paint);

    var rect2 = Rect.fromLTWH(0, size.height * 0.2, size.width * 0.15, size.height * 0.6);
    canvas.drawRect(rect2, paint);

    var rect3 = Rect.fromLTWH(0, size.height * 0.8, size.width, size.height * 0.2);
    canvas.drawRect(rect3, paint);

    var rect4 = Rect.fromLTWH(size.width * 0.85, size.height * 0.2, size.width * 0.2, size.height * 0.6);
    canvas.drawRect(rect4, paint);

    // Desenhar os cantos cortados
    paint.strokeWidth = 10;
    paint.color = corBordas;
    paint.style = PaintingStyle.stroke;
    Path path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.2);
    path.lineTo(size.width * 0.15, size.height * 0.2);
    path.lineTo(size.width * 0.15, size.height * 0.29);


    path.moveTo(size.width * 0.15, size.height * 0.7);
    path.lineTo(size.width * 0.15, size.height * 0.8);
    path.lineTo(size.width * 0.25, size.height * 0.8);

    path.moveTo(size.width * 0.75, size.height * 0.8);
    path.lineTo(size.width * 0.85, size.height * 0.8);
    path.lineTo(size.width * 0.85, size.height * 0.7);

    path.moveTo(size.width * 0.85, size.height * 0.29);
    path.lineTo(size.width * 0.85, size.height * 0.2);
    path.lineTo(size.width * 0.75, size.height * 0.2);

    canvas.drawPath(path, paint);

    // Texto Escanei um QR Code
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: size.height * 0.04,
      fontWeight: FontWeight.w500
    );
    final textSpan = TextSpan(
      text: 'Escaneie o QR Code',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset((size.width / 2) - textPainter.width /2, size.height * 0.1);
    textPainter.paint(canvas, offset);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}