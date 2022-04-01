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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(tripName),
            centerTitle: true,
          ),
        ],
      ),
    );
  }
}
