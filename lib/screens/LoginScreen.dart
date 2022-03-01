import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradise/widgets/ParadiseLogo.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _createAccountBtnController =
      RoundedLoadingButtonController();

  String _email = "";
  String _password = "";
  List<bool> _isSelected = [false, false, false];

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

  //todo:factor out text fields
  Widget _buildTextFields() {
    return Center(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _emailFilter,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.person_pin),
                ),
                labelText: 'اسم المستخدم',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'الاسم او رقم التليفون'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: _passwordFilter,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.lock_rounded),
                ),
                labelText: 'الرقم السري',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  //todo:factor out buttons
  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: RoundedLoadingButton(
            child: Text('دخول'),
            onPressed: _loginUser,
            controller: _loginBtnController,
            color: Colors.yellow,
            resetAfterDuration: true,
            duration: Duration(milliseconds: 1),
            completionDuration: Duration(milliseconds: 100),
            successColor: Colors.green,
          ),
        ),
      ],
    );
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

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
  void _loginUser() async => Timer(const Duration(seconds: 3), () {
        _loginBtnController.success();
      });

}
