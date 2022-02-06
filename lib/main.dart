import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/LoginScreen.dart';

void main() {
  runApp(ParadiseApp());
}

class ParadiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //RTL support
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(
          "ar",
          "AE",
        ), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale(
        "ar",
        "AE",
      ),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      title: 'Paradise App',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          fontFamily: 'Tajawal',
          textTheme: const TextTheme(
            bodyText2: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold),
          )),
      home: LoginScreen(),
    );
  }
}
