import 'dart:math';

import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  double radius;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    rotation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 1.0, curve: Curves.linear)));

    radius = 30.0;

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0,
        height: 100.0,
        child: Center(
            child: RotationTransition(
          turns: rotation,
          child: Stack(children: <Widget>[
            Transform.translate(
                offset: Offset(30*cos(pi), 30*sin(pi)),
            child: Container(
                width: radius/2,
                height: radius/2,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ))),
            Transform.translate(
                offset: Offset(30*cos(pi/2), 30*sin(pi/2)),
                child: Container(
                    width: radius/2,
                    height: radius/2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ))),
            Transform.translate(
                offset: Offset(30*cos(5*pi/6), 30*sin(5*pi/6)),
                child: Container(
                    width: radius/2,
                    height: radius/2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ))),
            Transform.translate(
                offset: Offset(30*cos(2*pi/3), 30*sin(2*pi/3)),
                child: Container(
                    width: radius/2,
                    height: radius/2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ))),
          ]),
        )));
  }
}
