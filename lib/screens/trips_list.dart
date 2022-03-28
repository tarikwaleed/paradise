import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/shared_components/trip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripsList extends StatelessWidget {
  const TripsList({Key? key}) : super(key: key);

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
          StreamBuilder<QuerySnapshot?>(
            stream: FirebaseFirestore.instance.collection('triips').snapshots(),
            builder: (context, snapshot) {
              // <3> Retrieve `List<DocumentSnapshot>` from snapshot
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return Expanded(
                child: ListView(

                    children: documents
                        .map((doc) => Card(
                              child: ListTile(
                                title: Text(doc['trip_name']),
                                subtitle: Text((doc['duration']).toString()),
                              ),
                            ))
                        .toList()),
              );
            },
          )
        ],
      ),
    );
  }
}
