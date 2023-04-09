import 'dart:math';

import 'package:flutter/material.dart';

List<List<Color>> tbColors = [
  [Colors.amber[800]!, Colors.amberAccent],
  [Colors.purple, Colors.yellow],
  [Colors.blue, Colors.yellow],
  [Colors.yellow, Colors.blue],
  [Colors.purpleAccent, Colors.yellowAccent],
  [Colors.blue, Colors.purpleAccent],
];
List<Color> generateUniqueColors() {
  Random random = Random();
  Set<Color> colors = {};

  while (colors.length < 20) {
    colors.add(Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256)));
  }

  return colors.toList();
}

const List<Color> myColors = [
  Color(0xffe57373), // Red
  Color(0xfff06292), // Pink
  Color(0xffba68c8), // Purple
  Color(0xff9575cd), // Deep Purple
  Color(0xff7986cb), // Indigo
  Color(0xff64b5f6), // Blue
  Color(0xff4fc3f7), // Light Blue
  Color(0xff4dd0e1), // Cyan
  Color(0xff4db6ac), // Teal
  Color(0xff81c784), // Green
  Color(0xffaed581), // Light Green
  Color(0xffff8a65), // Orange
  Color(0xffd4e157), // Lime
  Color(0xffffd54f), // Yellow
  Color(0xffffb74d), // Amber
  Color(0xffa1887f), // Brown
  Color(0xff90a4ae), // Blue Grey
];
