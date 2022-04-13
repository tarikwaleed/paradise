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
        appBar: AppBar(
          title: Text("تفاصيل الغرف"),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    ..._buildRadios(widget.numberOfRooms),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "المبلغ الاجمالي",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "10,000",
                style:
                TextStyle(fontSize: 80, fontWeight: FontWeight.bold,),
              ),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "بيانات العميل",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.arrow_forward_outlined),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(280, 50),
                ),
                onPressed: (){},
              ),
            ],
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
