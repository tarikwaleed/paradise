import 'package:flutter/material.dart';

class ParadiseLogo extends StatelessWidget {
  const ParadiseLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image.asset('assets/images/paradise_logo.png'),
      radius: 100,
    );
  }
}
