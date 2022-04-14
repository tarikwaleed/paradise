import 'package:flutter/material.dart';

import 'receipt_screen.dart';

class ClientDetailsScreen extends StatefulWidget {
  const ClientDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ClientDetailsScreen> createState() => _ClientDetailsScreenState();
}

class _ClientDetailsScreenState extends State<ClientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بيانات العميل"),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "اسم العميل",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "رقم التليفون",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 280,
                ),

                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "الايصال",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.arrow_forward_outlined),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(280, 50),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReceiptScreen())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
