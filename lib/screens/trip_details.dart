import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:paradise/shared_components/hotel_card.dart';

class TripDetails extends StatefulWidget {
  final String documentId;
  final Map<String, dynamic> data;

  const TripDetails({
    Key? key,
    required this.documentId,
    required this.data,
  }) : super(key: key);

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
        title: Text("رحلة " + widget.data['name']),
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
                itemCount: widget.data['hotels'].length,
                itemBuilder: (context, hotelIndex) {
                  return _buildHotel(
                      widget.data['hotels'][hotelIndex], hotelIndex);
                }),
          ),
        ],
      ),
    );
  }

  // Each hotel is a Map<dynamic,dynamic>
  Widget _buildHotel(Map<String, dynamic> hotelMap, int hotelIndex) {
    return HotelCard(
      documentId: widget.documentId,
      data: widget.data,
      hotelIndex: hotelIndex,
    );
  }
}
