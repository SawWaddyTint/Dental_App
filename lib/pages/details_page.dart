// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:dental_app/widgets/my_patients_horizontal_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GradientTopBackgroundView(),
            GradientBottomBackgroundView(),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Back_Text_Search_Menu_ButtonsView(),
                    SizedBox(
                      height: 40.0,
                    ),
                    OfficeAndPatientCountView()
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              bottom: 60.0,
              child: Center(
                child: CustomPaint(
                  painter: DrawCircle(),
                  size: Size(300, 300),
                ),
              ),
            ),
            CurrentTimeView(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                260,
                170,
                0,
                0,
              ),
              child: CircularContainerAndIconWidget(
                  "https://d338t8kmirgyke.cloudfront.net/icons/icon_pngs/000/007/205/original/injection.png",
                  color: Color.fromRGBO(53, 129, 241, 1.0)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                290,
                190,
                0,
                0,
              ),
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Color.fromRGBO(53, 129, 241, 1.0),
                    size: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                60,
                345,
                0,
                0,
              ),
              child: CircularContainerAndIconWidget(
                "https://d338t8kmirgyke.cloudfront.net/icons/icon_pngs/000/007/205/original/injection.png",
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 200.0,
                ),
                child: CircularContainerAndIconWidget(
                  "https://d338t8kmirgyke.cloudfront.net/icons/icon_pngs/000/007/205/original/injection.png",
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  0,
                  30.0,
                  60.0,
                ),
                child: Container(
                  height: 4,
                  width: 55,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 420,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: MyPatientsHorizontalListView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurrentTimeView extends StatelessWidget {
  const CurrentTimeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 250.0,
      bottom: 0.0,
      child: Center(
        child: Column(
          children: [
            Text(
              "2:45",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "pm",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OfficeAndPatientCountView extends StatelessWidget {
  const OfficeAndPatientCountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Office No.248",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "3 patients",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Back_Text_Search_Menu_ButtonsView extends StatelessWidget {
  const Back_Text_Search_Menu_ButtonsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        SizedBox(
          width: 100,
        ),
        Text(
          "Today",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 80,
        ),
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        Spacer(),
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ],
    );
  }
}

class GradientBottomBackgroundView extends StatelessWidget {
  const GradientBottomBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 280.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.2,
              color: Color.fromRGBO(
                12,
                68,
                145,
                1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GradientTopBackgroundView extends StatelessWidget {
  const GradientTopBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        // color: Colors.yellow,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(6.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(
                15,
                66,
                144,
                1.0,
              ),
              Color.fromRGBO(
                32,
                100,
                202,
                0.8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircularContainerAndIconWidget extends StatelessWidget {
  final Color color;
  final String imgUrl;
  CircularContainerAndIconWidget(this.imgUrl, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        // color: Color.fromRGBO(53, 129, 241, 1.0),
        color: color,
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Color.fromRGBO(53, 129, 241, 1.0),
              ),
              child: Center(
                child: Image.network(
                  imgUrl,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Outer Circle
    var outerCircle = Paint()
      ..strokeWidth = 2.0
      ..color = Color.fromRGBO(40, 117, 219, 1.0)
      ..style = PaintingStyle.fill;

    // Inner Circle
    var innerCircle = Paint()
      ..strokeWidth = 2.0
      ..color = Color.fromRGBO(31, 92, 184, 1.0)
      ..style = PaintingStyle.fill;

    // Dotted Circle
    var dottedCircle = Paint()
      ..strokeWidth = 0.5
      ..color = Colors.white;

    // Inntermost Circle
    var innermostCircle = Paint()
      ..strokeWidth = 2.0
      ..color = Color.fromRGBO(20, 77, 158, 1.0)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 140, outerCircle);

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 125, innerCircle);

    var radius = 100;
    var angle = (math.pi * 2) / 20;
    Offset center = Offset(size.width / 2, size.height / 2);
    // Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    for (int i = 1; i <= 20; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      canvas.drawCircle(Offset(x, y), 1.5, dottedCircle);
    }

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 75, innermostCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
