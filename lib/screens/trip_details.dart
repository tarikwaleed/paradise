import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TripDetails extends StatefulWidget {
  final String tripName;
  final int duration;
  final int totalNumberOfRooms;
  final List<dynamic> availableHotels;

  const TripDetails(
      {Key? key,
      required this.tripName,
      required this.duration,
      required this.totalNumberOfRooms,
      required this.availableHotels})
      : super(key: key);

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> hotelOneStream =
        widget.availableHotels[0].snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 100,
        title: Text("رحلة " + widget.tripName),
        centerTitle: true,
        actions: [
          // Total Number Of Rooms
          CircleAvatar(
            radius: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.duration.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ليالي",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
          ),
          SizedBox(
            width: 8,
          ),
          // Duration
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.totalNumberOfRooms.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "غرف",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: widget.availableHotels[0].snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              return Text("Hotel Name: ${snapshot.data!['hotel_name']} ");
            },
          ),
          // FutureBuilder<DocumentSnapshot>(
          //   future: widget.availableHotels[0].get(),
          //   builder: (BuildContext context,
          //       AsyncSnapshot<DocumentSnapshot> snapshot) {
          //     if (snapshot.hasError) {
          //       return Text("Something went wrong");
          //     }
          //
          //     if (snapshot.hasData && !snapshot.data!.exists) {
          //       return Text("Document does not exist");
          //     }
          //
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       Map<String, dynamic> data =
          //           snapshot.data!.data() as Map<String, dynamic>;
          //       return Text(
          //           "Hotel Name: ${data['hotel_name']} ");
          //     }
          //
          //     return Text("loading");
          //   },
          // )
          //
          // SizedBox(
          //   height: 40,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 20.0),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Text(
          //       "الفنادق المتاحة",
          //       style: TextStyle(
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
