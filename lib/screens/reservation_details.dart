import 'package:flutter/material.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({Key? key}) : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "بيانات العميل",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
