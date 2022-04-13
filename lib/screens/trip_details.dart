import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:paradise/shared_components/hotel_card.dart';

class TripDetails extends StatefulWidget {
  final String tripName;
  final int duration;
  final List<dynamic> availableHotels;

  const TripDetails(
      {Key? key,
      required this.tripName,
      required this.duration,
      required this.availableHotels})
      : super(key: key);

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("رحلة " + widget.tripName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "الفنادق المتاحة",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.availableHotels.length,
                itemBuilder: (context, index) {
                  return _buildHotel(widget.availableHotels[index]);
                }),
          ),
        ],
      ),
    );
  }

  // Each hotel is a Map<dynamic,dynamic>
  Widget _buildHotel(Map<String,dynamic> hotelMap) {
    return HotelCard(selectedHotel: hotelMap, tripDuration: widget.duration, tripName: widget.tripName);

  }
}
