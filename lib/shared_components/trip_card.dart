import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/screens/trip_details.dart';
import 'dart:math' as math;

import '../screens/HomeScreen.dart';

class TripCard extends StatelessWidget {
  final String tripName;
  final int duration;
  final List<dynamic> availableHotels;

  const TripCard({
    Key? key,
    required this.tripName,
    required this.availableHotels,
    required this.duration,
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
                  ))),
      child: Container(
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
