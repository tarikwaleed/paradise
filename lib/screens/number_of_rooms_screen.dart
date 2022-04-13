import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paradise/screens/rooms_details_screen.dart';


class NumberOfRoomsScreen extends StatefulWidget {
  final Map<String, dynamic> selectedHotel;
  final String tripName;
  final int tripDuration;

  const NumberOfRoomsScreen({
    Key? key,
    required this.selectedHotel,
    required this.tripName,
    required this.tripDuration,
  }) : super(key: key);

  @override
  State<NumberOfRoomsScreen> createState() => _NumberOfRoomsScreenState();
}

class _NumberOfRoomsScreenState extends State<NumberOfRoomsScreen> {
  final TextEditingController _numberOfRoomsFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حجز في فندق ${widget.selectedHotel['hotel_name']}"),
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

}
