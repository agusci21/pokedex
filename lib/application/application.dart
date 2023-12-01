import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
import 'package:flutter_template/application/localizations/locales.dart';
import 'package:flutter_template/features/home/home_module.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (_) => Colors.pink.shade900,
            ),
            shape: MaterialStateProperty.resolveWith(
              (_) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        primaryColor: const Color(0xffdc0a2d),
        splashColor: Colors.pink.shade900,
        scaffoldBackgroundColor: const Color(0xffdc0a2d),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xffdc0a2d), elevation: 0),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.pink.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: _generateRoutes(),
      initialRoute: HomeModule.homeRoute,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: Locales.suportedLanguages,
    );
  }

  Map<String, Widget Function(BuildContext)> _generateRoutes() => {
        ...HomeModule.generateRoutes(),
      };
}
