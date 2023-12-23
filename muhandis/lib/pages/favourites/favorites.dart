import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:muhandis/consts/firebase_consts.dart';

import '../../models/data.dart';
import '../../widgets/favorite_item.dart';

class favorites_screen extends StatelessWidget {
  const favorites_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My favorites',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(currentUser!.uid)
                .collection('favorites')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final internships = snapshot.data!.docs;
              return AnimationLimiter(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: internships
                    .length, // Replace this with your actual item count
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 400),
                    columnCount: 2,
                    child: ScaleAnimation(
                      scale: 0.5, // Initial scale value
                      child: FadeInAnimation(
                        child: FavoriteItem(
                          name: internships[index]['title'],
                          field: internships[index]['field'],
                          duration: internships[index]['duration'],
                          imageUrl: internships[index]['image'],
                        ), // Replace this with your custom widget
                      ),
                    ),
                  );
                },
              ));
            }));
  }
}
