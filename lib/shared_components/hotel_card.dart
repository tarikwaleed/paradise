import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/screens/trip_details.dart';
import 'dart:math' as math;

import '../screens/HomeScreen.dart';

class HotelCard extends StatelessWidget {
  final String hotelName;
  final int numberOfRooms;
  final int nightPricePerPerson;
  final int tripDuration;

  const HotelCard({
    Key? key,
    required this.hotelName,
    required this.numberOfRooms,
    required this.nightPricePerPerson,
    required this.tripDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 170,
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
                  backgroundColor: numberOfRooms == 0
                      ? Colors.redAccent
                      : Colors.yellow,
                  radius: 25,
                  child: Text(
                    numberOfRooms.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  hotelName,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
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
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: defaultPadding * 4,
                ),
                Text(
                  (nightPricePerPerson*tripDuration).toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  width: defaultPadding/2,
                ),
                Text(
                  "جنية للفرد",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
