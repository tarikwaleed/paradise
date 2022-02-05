import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradise/screens/HomeScreen.dart';
import 'package:paradise/screens/VerficationCodeScreen.dart';
import 'package:paradise/widgets/ParadiseLogo.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

enum FormType { login, register }

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form_type = FormType.login;
  List<bool> _isSelected = [false, false, false];

  _LoginScreenState() {
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
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            _buildLogo(),
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0, top: 20.0),
      child: ParadiseLogo(),
    );
  }

  Widget _buildTextFields() {
    return Center(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _emailFilter,
            decoration: const InputDecoration(
                labelText: 'اسم المستخدم',
                border: OutlineInputBorder(),
                hintText: 'الاسم او رقم التليفون'),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: _passwordFilter,
              decoration: const InputDecoration(
                labelText: 'الرقم السري',
                border: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.bodyText2,
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  //todo:change the logic
  Widget _buildButtons() {
    if (_form_type == FormType.login) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('دخول'),
              onPressed: _loginPressed,
            ),
          ),
          TextButton(
            child: Text('ليس لديك حساب؟ انشاء حساب.'),
            onPressed: _formChange,
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          //todo:put the three circular buttons here
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ToggleButtons(
              children: const <Widget>[
                Icon(Icons.person),
                Icon(Icons.person),
                Icon(Icons.person),
              ],
              onPressed: (int index) {
                setState(() {
                  //loops over the buttons and checks if the index of the button
                  //equals the index of the selected item
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _isSelected[buttonIndex] = true;
                    } else {
                      _isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: _isSelected,
              color: Colors.grey,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('مدير|موظف|مشرف', style: TextStyle(fontSize: 16))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('انشاء حساب'),
              onPressed: _createAccountPressed,
            ),
          ),
          TextButton(
            child: Text('لديك حساب بالفعل؟ دخول.'),
            onPressed: _formChange,
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
          )
        ],
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void _createAccountPressed() {
    print('The user wants to create an accoutn with $_email and $_password');
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VerficationCodeScreen()));
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}
