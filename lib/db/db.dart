import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference trips = FirebaseFirestore.instance.collection('trips');

abstract class Database {
  static Future<void> reserve(
      String documentId, int hotelIndex, int totalNumberOfRooms) {
    return trips
        .doc(documentId)
        .update({'hotels.$hotelIndex.reserved': FieldValue.increment(totalNumberOfRooms)}).catchError(
            (error) => print("Failed to update hotel: $error"));
  }
}
