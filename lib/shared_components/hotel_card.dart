import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/screens/number_of_rooms_screen.dart';
import 'package:paradise/screens/trip_details.dart';
import 'dart:math' as math;

import '../screens/HomeScreen.dart';

class HotelCard extends StatelessWidget {
  final String hotelName;
  final int numberOfRooms;
  final int nightPricePerPerson;
  final int tripDuration;
  final String tripName;

  const HotelCard({
    Key? key,
    required this.hotelName,
    required this.numberOfRooms,
    required this.nightPricePerPerson,
    required this.tripDuration,
    required this.tripName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 140,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NumberOfRoomsScreen(
                      tripName: tripName,
                      tripDuration: tripDuration,
                      nightPricePerPerson: nightPricePerPerson,
                    ))),
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: defaultPadding ,
                  ),
                  Text(
                    (nightPricePerPerson * tripDuration).toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding / 2,
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
      ),
    );
  }
}
