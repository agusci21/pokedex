import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/presentation/pages/home_page.dart';

abstract class HomeModule {
  static const homeRoute = '/';
  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        homeRoute: (context) => HomePage(),
      };
}
