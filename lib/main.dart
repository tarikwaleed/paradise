import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paradise/providers/authentication_provider.dart';
import 'package:paradise/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ParadiseApp());
}

class ParadiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
          initialData: null,
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return HomeScreen();
    }
    //The user isn't logged in and hence navigate to SignInPage.
    return LoginScreen();
  }
}
