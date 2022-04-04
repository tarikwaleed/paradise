
import 'package:flutter/material.dart';

class TripDetails extends StatelessWidget {
  final String tripName;
  final int duration;
  final int totalNumberOfRooms;

  const TripDetails({
    Key? key,
    required this.tripName,
    required this.duration,
    required this.totalNumberOfRooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 100,
        title: Text("رحلة " + tripName),
        centerTitle: true,
        actions: [
          // Total Number Of Rooms
          CircleAvatar(
            radius: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  duration.toString(),
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
                  totalNumberOfRooms.toString(),
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
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "الفنادق المتاحة",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
