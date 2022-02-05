import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:paradise/screens/HomeScreen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class VerficationCodeScreen extends StatefulWidget {
  const VerficationCodeScreen({Key? key}) : super(key: key);

  @override
  _VerficationCodeScreenState createState() => _VerficationCodeScreenState();
}

class _VerficationCodeScreenState extends State<VerficationCodeScreen> {
  final TextEditingController _verficationCodeController =
      TextEditingController();
  String _verficationCode = "";
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 2), () {
      _buttonController.success();

    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رمز التحقق'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'ادخل رمز التحقق الخاص بحسابك',
              ),
            ),
            TextFormField(
              controller: _verficationCodeController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رمز التحقق الخاص بك'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RoundedLoadingButton(
                controller: _buttonController,
                onPressed: _doSomething,
                child: Text('تحقق'),
                resetAfterDuration: true,
                successColor: Colors.green,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
