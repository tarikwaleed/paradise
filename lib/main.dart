import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paradise/screens/HomeScreen.dart';
import 'screens/LoginScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ParadiseApp());
}

class ParadiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
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
        textTheme: GoogleFonts.tajawalTextTheme(),
      ),
      home: LoginScreen(),
    );
  }
}
