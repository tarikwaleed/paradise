import 'package:flutter/material.dart';

enum RoomType { single, double, triple }

class RoomTypeRadio extends StatefulWidget {
  const RoomTypeRadio({Key? key}) : super(key: key);

  @override
  State<RoomTypeRadio> createState() => _RoomTypeRadioState();
}

class _RoomTypeRadioState extends State<RoomTypeRadio> {
  RoomType? _roomType = RoomType.single;
  int _numberOfPersons = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_numberOfPersons.toString()),
        RadioListTile<RoomType>(
          title: const Text('سنجل'),
          value: RoomType.single,
          groupValue: _roomType,
          onChanged: (RoomType? value) {
            setState(() {
              _roomType = value;
              switch (value) {
                case RoomType.single:
                  {
                    _numberOfPersons = 1;
                  }
                  break;
                case RoomType.double:
                  {
                    _numberOfPersons = 2;
                  }
                  break;
                case RoomType.triple:
                  {
                    _numberOfPersons = 3;
                  }
                  break;
              }
            });
          },
        ),
        RadioListTile<RoomType>(
          title: const Text('دبل'),
          value: RoomType.double,
          groupValue: _roomType,
          onChanged: (RoomType? value) {
            setState(() {
              _roomType = value;
            });
          },
        ),
        RadioListTile<RoomType>(
          title: const Text('تربل'),
          value: RoomType.triple,
          groupValue: _roomType,
          onChanged: (RoomType? value) {
            setState(() {
              _roomType = value;
            });
          },
        ),
      ],
    );
  }
}
