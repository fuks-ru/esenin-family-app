import 'package:flutter/material.dart';

class AppRoute {
  final Widget widget;
  final NavigationDestination navigationDestination;

  AppRoute(String title, {required this.widget, required IconData iconData})
      : navigationDestination =
            NavigationDestination(icon: Icon(iconData), label: title),
        assert(title.length >= 3);
}
