import 'package:flutter/material.dart';

class TripDetails extends StatefulWidget {
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
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
