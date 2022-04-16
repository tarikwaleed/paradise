import 'package:flutter/material.dart';

import '../shared_components/ParadiseLogo.dart';

class ReceiptScreen extends StatefulWidget {
  final String clientName;
  final String clientPhoneNumber;
  final String clientWhatsappNumber;

  const ReceiptScreen({
    Key? key,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.clientWhatsappNumber,
  }) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              _buildLogo(),
              _buildSlogan(),
              _buildDivider(),
              _buildTitle(),
              SizedBox(
                height: 10,
              ),
              _buildDateTime(),
              _buildDivider(),
              _buildClientDetails(),
              _buildDivider(),
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
      "شركة السياحة الرائدة في اسيوط",
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

  Widget _buildClientDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "بيانات العميل",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الاسم : ${widget.clientName}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "رقم التليفون : ${widget.clientPhoneNumber}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "رقم الواتساب : ${widget.clientWhatsappNumber}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Column(
      children: [
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
      ],
    );
  }
}
