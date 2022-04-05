import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/screens/trip_details.dart';
import 'dart:math' as math;

import '../screens/HomeScreen.dart';

class TripCard extends StatelessWidget {
  final String tripName;
  final int duration;
  final int totalNumberOfRooms;
  final List<dynamic> availableHotels;

  const TripCard({
    Key? key,
    required this.tripName,
    required this.availableHotels,
    required this.duration,
    required this.totalNumberOfRooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TripDetails(
                  tripName: tripName,
                  duration: duration,
                  availableHotels: availableHotels,
                  totalNumberOfRooms: totalNumberOfRooms))),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 240,
        width: double.maxFinite,
        child: Card(
          // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          elevation: 5,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: totalNumberOfRooms == 0
                        ? Colors.redAccent
                        : Colors.yellow,
                    radius: 25,
                    child: Text(
                      totalNumberOfRooms.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 27,
                  ),
                  Text("غرفة"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tripName,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: defaultPadding * 7,
                  ),
                  Text(
                    duration.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Text(
                    "ليالي",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
