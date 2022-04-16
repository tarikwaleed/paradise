import 'package:flutter/material.dart';

import '../shared_components/ParadiseLogo.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              _buildLogo(),
              _buildSlogan(),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
                thickness: 5,
              ),
              SizedBox(
                height: 30,
              ),
              _buildTitle(),
              SizedBox(
                height: 20,
              ),
              _buildDateTime(),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.black,
                thickness: 5,
              ),
            ],
          ),
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

  Widget _buildSlogan() {
    return Text(
      "شركة السياحه الرائده في اسيوط",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "ايصال دفع",
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDateTime() {
    final now = DateTime.now();
    return Text(
      "الوقت والتاريخ: ${now.hour}:${now.minute} | ${now.day}-${now.month}-${now.year}",
      style: TextStyle(fontSize: 25),
    );
  }
}
