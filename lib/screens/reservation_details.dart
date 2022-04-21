import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paradise/db/db.dart';

class ReservationDetails extends StatefulWidget {
  final String documentId;
  final Map<String, dynamic> data;
  final int hotelIndex;

  const ReservationDetails(
      {Key? key,
      required this.documentId,
      required this.data,
      required this.hotelIndex})
      : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(),
          ),
        ],
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text(
            "حجز في فندق ${widget.data['hotels'][widget.hotelIndex.toString()]['hotel_name']}"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    Database.reserve(widget.documentId, widget.hotelIndex, 9);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "بيانات العميل",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
