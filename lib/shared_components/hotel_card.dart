import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/screens/reservation_details.dart';
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
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReservationDetails(
                      documentId: documentId,
                      data: data,
                      hotelIndex: hotelIndex,
                    ))),
        child: Card(
          // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          child: Stack(children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
              child: Image.asset(
                'assets/images/hotel${math.Random().nextInt(6)}.jpg',
                width: 500,
                height: 500,
                fit: BoxFit.fill,
              ),
            ),
            Column(
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
                        "${(data['hotels'][hotelIndex.toString()]['nrooms']) - (data['hotels'][hotelIndex.toString()]['reserved'])}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    ..._buildStars(
                        data['hotels'][hotelIndex.toString()]['stars']),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text("غرفة",style: TextStyle(color: Colors.white),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (data['hotels'][hotelIndex.toString()]['hotel_name'])
                          .toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                      (data['hotels'][hotelIndex.toString()]['price'])
                          .toString(),
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  List<Widget> _buildStars(int numberOfStars) {
    List<Widget> listOfStars = [];
    for (int i = 0; i < numberOfStars; i++) {
      listOfStars.add(Image.asset(
        'assets/images/star.png',
        width: 35,
        height: 35,
      ));
    }
    return listOfStars;
  }
}
