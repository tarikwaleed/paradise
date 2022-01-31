import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      title: 'xTours App',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          fontFamily: 'Tajawal',
          textTheme: const TextTheme(
            bodyText2: TextStyle(
                fontSize: 20.0, fontFamily: 'Tajawal-Black',fontWeight: FontWeight.bold ),

          )


      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form_type = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // toggle between the two forms
  void _formChange() async {
    setState(() {
      _form_type = (_form_type == FormType.register)
          ? FormType.login
          : FormType.register;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextFields(),
            // _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: <Widget>[

        TextField(
          controller: _emailFilter,
          decoration: const InputDecoration(labelText: 'اسم المستخدم'),
          style: Theme
              .of(context)
              .textTheme
              .bodyText2,
        ),
        Container(
          child: TextField(
            controller: _passwordFilter,
            decoration: InputDecoration(labelText: 'الرقم السري'),
            style: Theme
                .of(context)
                .textTheme
                .bodyText2,
            obscureText: true,
          ),
        )
      ],
    );
  }

  Widget _buildButtons() {
    if (_form_type == FormType.login) {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Login'),
              onPressed: _loginPressed,
            ),
            FlatButton(
              child: Text('Dont have an account? Tap here to register.'),
              onPressed: _formChange,
            ),
            FlatButton(
              child: Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            FlatButton(
              child: Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
  }

  void _createAccountPressed() {
    print('The user wants to create an accoutn with $_email and $_password');
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}
