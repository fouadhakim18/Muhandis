import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/firebase_consts.dart';
import 'package:muhandis/models/internship.dart';

class FirestoreServices {
  final CollectionReference internshipsCollection =
      FirebaseFirestore.instance.collection('internships');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addToFavorites(String internshipId, String title, String field,
      String duration, String image) async {
    Get.snackbar(
      'SUCCESS', // Title of the snackbar
      'Internship added to favorites',
      snackPosition: SnackPosition.BOTTOM, // Position of the toast
      duration: Duration(seconds: 1), // Duration the toast is displayed
      backgroundColor: Colors.green[800], // Background color of the toast
      colorText: Colors.white, // Text color of the toast
    );
    await usersCollection.doc(currentUser!.uid).collection('favorites').add(
        {'title': title, 'field': field, 'duration': duration, 'image': image});
  }

  Future<void> applyInternship(String internshipId, String title, String field,
      String duration, String image) async {
    Get.snackbar(
      'SUCCESS', // Title of the snackbar
      'Internship registered',
      snackPosition: SnackPosition.BOTTOM, // Position of the toast
      duration: Duration(seconds: 1), // Duration the toast is displayed
      backgroundColor: Colors.green[800], // Background color of the toast
      colorText: Colors.white, // Text color of the toast
    );
    await usersCollection.doc(currentUser!.uid).collection('applied').add({
      "id": internshipId,
      'title': title,
      'field': field,
      'duration': duration,
      'image': image
    });

    print("yes");
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Internship>> getFilteredInternships(
    String location,
  ) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('internships')
        .where('location', isEqualTo: location)
        .get();

    return querySnapshot.docs
        .map((doc) => Internship.fromFirestore(doc))
        .toList();
  }
}
