import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFFE2E2),
      body: Stack(
        children: [
          Positioned(
            bottom: 60,
            left: size.width * 0.5 - size.width * 0.10,
            child: SizedBox(
              height: size.width * 0.20,
              width: size.width * 0.20,
              child: FittedBox(
                child: FloatingActionButton(
                  elevation: 0.0,
                  backgroundColor: Color(0xffAAAAAA),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: 100,
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 100),
                      painter: CustomPainterNav(),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class CustomPainterNav extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xffF6F6F6)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 35)
      ..quadraticBezierTo(0, 0, size.width * 0.125, 00)
      ..lineTo(size.width * 0.300, 00)
      ..quadraticBezierTo(size.width * 0.375, 00, size.width * 0.385, 20)
      ..arcToPoint(Offset(size.width * 0.615, 20),
          radius: const Radius.circular(50.0), clockwise: false)
      ..quadraticBezierTo(size.width * 0.625, 00, size.width * 0.70, 00)
      ..lineTo(size.width * 0.875, 00)
      ..quadraticBezierTo(size.width, 00, size.width, 35)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
