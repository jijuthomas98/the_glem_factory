import 'package:flutter/material.dart';

LinearGradient kGradientStyle = LinearGradient(
  colors: [Color(0xFFFF7D7D), Color(0xFFEEAECA)],
  stops: [0, 1],
  begin: Alignment.center,
);

BoxShadow kBoxShadow = BoxShadow(
  blurRadius: 6.0,
  color: Colors.black26,
  offset: Offset(4.0, 4.0),
);

TextStyle kHeadingStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'inter',
  fontWeight: FontWeight.w600,
);

TextStyle kNoticeStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
