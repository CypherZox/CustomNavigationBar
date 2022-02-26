import 'package:custom_painter/icons/h.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _width = 80;
  double _height = 80;

  final Widget _plus = Image.asset(
    './lib/icons/icons8-plus-48 (1).png',
    width: 30,
    height: 30,
  );
  Widget _iconsStack(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            './lib/icons/Key-icon.png',
            width: 25,
            height: 25,
          ),
          Image.asset(
            './lib/icons/Folder-icon.png',
            width: 25,
            height: 25,
          ),
          Image.asset(
            './lib/icons/Search-icon.png',
            width: 25,
            height: 25,
          ),
        ],
      );
  late Widget _myWdget = _plus;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffFFE2E2),
      body: FocusScope(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.width * 0.17),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _height == 80 ? _height += 100 : _height -= 100;

                        _myWdget == _plus
                            ? _myWdget = _iconsStack(context)
                            : _myWdget = _plus;
                      });
                    },
                    child: AnimatedContainer(
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((_width) / 2),
                          color: const Color(0xffAAAAAA)),
                      child: AnimatedSwitcher(
                        child: _myWdget,
                        duration: const Duration(milliseconds: 1000),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastOutSlowIn,
                    ),
                  )),
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
                )),
          ],
        ),
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
