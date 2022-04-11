import 'package:flutter/material.dart';

enum RoomTypes { single, double, triple }

class RoomTypeRadio extends StatefulWidget {
  const RoomTypeRadio({Key? key}) : super(key: key);

  @override
  State<RoomTypeRadio> createState() => _RoomTypeRadioState();
}

class _RoomTypeRadioState extends State<RoomTypeRadio> {
  RoomTypes? _roomType = RoomTypes.single;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
