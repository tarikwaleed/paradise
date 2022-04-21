import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/screens/trip_details.dart';
import 'dart:math' as math;

import '../screens/HomeScreen.dart';

class HotelCard extends StatelessWidget {
  final String documentId;
  final Map<String, dynamic> data;
  final int hotelIndex;

  const HotelCard({
    Key? key,
    required this.documentId,
    required this.data,
    required this.hotelIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 200,
      width: double.maxFinite,
      child: GestureDetector(
        // onTap: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => NumberOfRoomsScreen(
        //               tripName: data['name'],
        //               tripDuration: data['duration'],
        //               selectedHotel: selectedHotel,
        //             ))),
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
                    radius: 25,
                    child: Text(
                      "${data['hotels'][hotelIndex]['nrooms']}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text("غرفة")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (data['hotels'][hotelIndex]['hotel_name']).toString(),
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
                    width: defaultPadding,
                  ),
                  Text(
                    (data['hotels'][hotelIndex]['price']).toString(),
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
