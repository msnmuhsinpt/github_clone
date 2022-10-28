//divider

import 'package:flutter/material.dart';

Widget dividerH() {
  return const SizedBox(height: 20);
}

Widget dividerSH() {
  return const SizedBox(height: 8);
}

Widget dividerSW() {
  return const SizedBox(width: 8);
}

Widget dividerSSW() {
  return const SizedBox(width: 3);
}

Widget dividerW() {
  return const SizedBox(width: 20);
}

//screen size

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}