import 'package:flutter/material.dart';
import 'package:paradise/constants.dart';
import 'package:paradise/shared_components/trip_card.dart';

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
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return TripCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
