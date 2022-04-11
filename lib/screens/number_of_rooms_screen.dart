import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paradise/screens/rooms_details_screen.dart';

enum RoomTypes { single, double, triple }

class NumberOfRoomsScreen extends StatefulWidget {
  final String tripName;
  final int tripDuration;
  final int nightPricePerPerson;

  const NumberOfRoomsScreen({
    Key? key,
    required this.tripName,
    required this.tripDuration,
    required this.nightPricePerPerson,
  }) : super(key: key);

  @override
  State<NumberOfRoomsScreen> createState() => _NumberOfRoomsScreenState();
}

class _NumberOfRoomsScreenState extends State<NumberOfRoomsScreen> {
  final TextEditingController _numberOfRoomsFilter = TextEditingController();
  final _numberOfRoomsFormKey = GlobalKey<FormState>();
  RoomTypes? _roomType = RoomTypes.single;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حجز في رحلة ${widget.tripName}"),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "عدد الغرف",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _numberOfRoomsFilter,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 160, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                ElevatedButton(
                  child: Text(
                    "التالي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(280, 50),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomsDetailsScreen(
                            numberOfRooms:
                                int.parse(_numberOfRoomsFilter.text)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoomTypeRadioButtons() {
    return Expanded(
        child: ListView(
      children: [
        RadioListTile<RoomTypes>(
          title: const Text('سنجل'),
          value: RoomTypes.single,
          groupValue: _roomType,
          onChanged: (RoomTypes? value) {
            setState(() {
              _roomType = value;
            });
          },
        ),
        RadioListTile<RoomTypes>(
          title: const Text('دبل'),
          value: RoomTypes.double,
          groupValue: _roomType,
          onChanged: (RoomTypes? value) {
            setState(() {
              _roomType = value;
            });
          },
        ),
        RadioListTile<RoomTypes>(
          title: const Text('تربل'),
          value: RoomTypes.triple,
          groupValue: _roomType,
          onChanged: (RoomTypes? value) {
            setState(() {
              _roomType = value;
            });
          },
        ),
      ],
    ));
  }
}
