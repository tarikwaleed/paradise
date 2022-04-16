import 'package:flutter/material.dart';

import '../shared_components/ParadiseLogo.dart';

class ReceiptScreen extends StatefulWidget {
  final String clientName;
  final String clientPhoneNumber;
  final String clientWhatsappNumber;
  final int numberOfRooms;
  final String hotelName;


  const ReceiptScreen({
    Key? key,
    required this.clientName,
    required this.clientPhoneNumber,
    required this.clientWhatsappNumber,
    required this.numberOfRooms,
    required this.hotelName,
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
              const SizedBox(
                height: 40,
              ),
              _buildLogo(),
              _buildSlogan(),
              _buildDivider(),
              _buildTitle(),
              const SizedBox(
                height: 10,
              ),
              _buildDateTime(),
              _buildDivider(),
              _buildClientDetails(),
              _buildDivider(),
              _buildReservationDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50.0, top: 20.0),
      child: ParadiseLogo(),
    );
  }

  Widget _buildSlogan() {
    return const Text(
      "شركة السياحة الرائدة في اسيوط",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      "ايصال دفع",
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDateTime() {
    final now = DateTime.now();
    return Text(
      "الوقت والتاريخ: ${now.hour}:${now.minute} | ${now.day}-${now.month}-${now.year}",
      style: const TextStyle(fontSize: 25),
    );
  }

  Widget _buildClientDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "بيانات العميل",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الاسم : ${widget.clientName}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "رقم التليفون : ${widget.clientPhoneNumber}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "رقم الواتساب : ${widget.clientWhatsappNumber}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReservationDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "تفاصيل الحجز",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(
              "اسم الفندق : ${widget.hotelName}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(
              "عدد الغرف : ${widget.numberOfRooms.toString()}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: const [
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
