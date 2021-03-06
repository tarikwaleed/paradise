import 'package:flutter/material.dart';

import '../shared_components/ParadiseLogo.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            _buildDivider(),
            Widget_buildChildrenDetails(),
          ],
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
                "الاسم : طارق وليد",
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
                "رقم التليفون : 01153905279",
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
                "رقم الواتساب : 01065590159",
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
          children: [
            Text(
              "اسم الفندق : هاواي سيذر",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "عدد الغرف : 5",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "عدد الغرف الدبل : 5",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "عدد الغرف التربل : 0",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "عدد الغرف السنجل : 0",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // row of three columns
          children: [
            Column(
              children: [Text("الاجمالي"), Text("10000")],
            ),
            Column(
              children: [Text("المدفوع"), Text("10000")],
            ),
            Column(
              children: [Text("الباقي"), Text("0")],
            ),
          ],
        )
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

Widget_buildChildrenDetails() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        children: [
          Text(
            "بيانات الاطفال",
            style: TextStyle(fontSize: 25),
          ),
          Text("عدد الاطفال:3"),
          Text("سن الطفل 1 :2.5"),
          Text("سن الطفل 2 :3.5"),
          Text("سن الطفل 3 :4.5"),
        ],
      ),
    ],
  );
}
