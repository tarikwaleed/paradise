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
            title: Text("رحلة " + tripName),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
