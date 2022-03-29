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
          //todo: working on this part!
          StreamBuilder<QuerySnapshot>(
            stream: _tripsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return TripCard(
                        tripName: data['trip_name'],
                        tripDuration: data['duration']);
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
