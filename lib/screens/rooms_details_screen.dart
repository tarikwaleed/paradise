import 'package:flutter/material.dart';
import 'package:paradise/helpers/room_type_radio.dart';

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
        child: Center(
          child: Expanded(
            child: ListView(
              children: <Widget>[
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
                ..._buildRadios(widget.numberOfRooms)
              ],
            ),
          ),
        ),
      ),
    ));
  }

  List<Widget> _buildRadios(int numberOfRooms) {
    List<Widget> radios = [];
    for (int i = 1; i <= numberOfRooms; i++) {
      radios.add(Text(
        "نوع الغرفه ${i}",
        style: TextStyle(
          fontSize: 20,
          color: Colors.blue,
        ),
      ));
      radios.add(RoomTypeRadio());
      radios.add(SizedBox(
        height: 20,
      ));
    }
    return radios;
  }
}
