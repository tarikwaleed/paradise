import 'package:flutter/material.dart';

class RoomsDetailsScreen extends StatefulWidget {
  final int numberOfRooms;

  const RoomsDetailsScreen({
    Key? key,
    required this.numberOfRooms,
  }) : super(key: key);

  @override
  State<RoomsDetailsScreen> createState() => _RoomsDetailsScreenState();
}

class _RoomsDetailsScreenState extends State<RoomsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "تفاصيل الغرف",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${widget.numberOfRooms}",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    ));
  }
}
