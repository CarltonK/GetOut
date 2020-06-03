import 'package:flutter/material.dart';

Widget backGround() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
            stops: [0.5, 1])),
  );
}
