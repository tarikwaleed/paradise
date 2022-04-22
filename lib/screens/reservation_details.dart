import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            child: CircleAvatar(
              child: _getHotelAvailableNumberOfRooms(),
            ),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "تفاصيل الحجز",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "عدد الاشخاص",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "عدد الغرف الدبل",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "عدد الغرف التربل",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "عدد الغرف السنجل",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "الاجمالي",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "15000",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "الباقي",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "5000",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "المبلغ المدفوع",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("حجز"),
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

  Widget _getHotelAvailableNumberOfRooms() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('trips')
            .doc(widget.documentId)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading");
          }
          var tripDocument = snapshot.data!;
          int nrooms =
              tripDocument['hotels'][widget.hotelIndex.toString()]['nrooms'];
          int reserved =
              tripDocument['hotels'][widget.hotelIndex.toString()]['reserved'];
          int available = nrooms - reserved;
          return Text(
            available.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          );
        });
  }
}
