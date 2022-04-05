import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/shared_components/trip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripsList extends StatefulWidget {
  const TripsList({Key? key}) : super(key: key);

  @override
  State<TripsList> createState() => _TripsListState();
}

class _TripsListState extends State<TripsList> {
  final Stream<QuerySnapshot> _tripsStream =
      FirebaseFirestore.instance.collection('triips').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo: this Column must be refactored because it's causing a bunch of rendering errors
      // try using SliverList or something like that
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: defaultPadding,
              ),
              Text("الرحلات",
                  style: TextStyle(
                    fontSize: 50,
                  )),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _tripsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return Expanded(
                flex: 3,
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return TripCard(
                      tripName: data['trip_name']??'',
                      duration: data['duration']??0,
                      totalNumberOfRooms: data['total_number_of_rooms']??0,
                      availableHotels: data['available_hotels']??[],
                    );
                  }).toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
