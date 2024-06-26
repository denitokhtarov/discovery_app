import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void systemUIOverStyle(BuildContext context) {
  RendererBinding.instance.renderViews.toList()[0].automaticSystemUiAdjustment =
      false;
  bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
  Color overlayColor = isDark ? Colors.black : Colors.white;
  Brightness overlayBrightness = isDark ? Brightness.light : Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: overlayColor,
    statusBarIconBrightness: overlayBrightness,
    systemNavigationBarColor: overlayColor,
    systemNavigationBarIconBrightness: overlayBrightness,
  ));
}
