import 'package:flutter/material.dart';
import 'package:github_clone/core/app_color.dart';

Widget appTextView(
    {String name = "",
      double size = 15,
      int maxLines = 1,
      Color color = aBlack,
      bool isBold = false}) {
  return Text(
    name,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        color: color),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}