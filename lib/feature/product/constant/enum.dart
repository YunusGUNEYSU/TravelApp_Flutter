import 'package:flutter/material.dart';

enum ImageEnums { door, camp_alt, camp_alt2 }

extension ImageEnumsExtension on ImageEnums {
  String get toPath => 'asset/images/$name.png';
  Image get toImage => Image.asset(toPath);
}