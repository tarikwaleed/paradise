import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'dart:math' as math;

class TripCard extends StatelessWidget {
  final String tripName;
  final int tripDuration;

  const TripCard({
    Key? key,
    required this.tripName,
    required this.tripDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 200,
      width: double.maxFinite,
      child: Card(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
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
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: defaultPadding * 7,
                ),
                Text(
                  tripDuration.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
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
                    color: Colors.white70,
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
