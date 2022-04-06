import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum RoomTypes { single, double, triple }

class ReservationScreen extends StatefulWidget {
  final String tripName;
  final int tripDuration;
  final int nightPricePerPerson;

  const ReservationScreen({
    Key? key,
    required this.tripName,
    required this.tripDuration,
    required this.nightPricePerPerson,
  }) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  RoomTypes? _roomType=RoomTypes.single;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حجز في رحلة ${widget.tripName}"),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "بيانات الغرف",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'عدد الغرف',
                ),
                onChanged: (numberOfRooms){

                },
              ),
              SizedBox(
                height: 20,
              ),
              _buildRoomTypeRadioButtons(),
            ],
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
