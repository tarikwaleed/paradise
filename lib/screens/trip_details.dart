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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calendar_today),
        onPressed: () {},
      ),
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "الفنادق المتاحة",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.availableHotels.length,
                itemBuilder: (context, index) {
                  return _buildHotel(widget.availableHotels[index]);
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildHotel(DocumentReference hotelReference) {
    return StreamBuilder<DocumentSnapshot>(
      stream: hotelReference.snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        String hotelName = snapshot.data?['hotel_name'] ?? "";
        int hotelNumberOfRooms = snapshot.data?['number_of_rooms'] ?? 0;
        return ListTile(
          title: Text("$hotelName "),
          subtitle: Text("$hotelNumberOfRooms"),
        );
      },
    );
  }
}
