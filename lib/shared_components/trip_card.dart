import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 220,
      width: double.maxFinite,
      child: const Card(
        elevation: 5,
      ),
    );
  }
}
