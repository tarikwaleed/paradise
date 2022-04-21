import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference trips = FirebaseFirestore.instance.collection('trips');

Future<void> updateTrip() {
  return trips
      .doc('1')
      .update({'name': '8مايو'})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> Reserve(String documentId, int hotelIndex) {
  return trips
      .doc(documentId)
      .update({'hotels.$hotelIndex.reserved': 9}).catchError(
          (error) => print("Failed to update hotel: $error"));
}
