import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:muhandis/consts/firebase_consts.dart';
import 'package:muhandis/pages/internships_history/pending_internships_container.dart';

class PendingInternships extends StatefulWidget {
  const PendingInternships({super.key});

  @override
  State<PendingInternships> createState() => _PendingInternshipsState();
}

class _PendingInternshipsState extends State<PendingInternships> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser!.uid)
            .collection('applied')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final internships = snapshot.data!.docs;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimationLimiter(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: internships.length,
                      itemBuilder: (context, i) {
                        return AnimationConfiguration.staggeredList(
                          position: i,
                          duration: const Duration(milliseconds: 400),
                          child: ScaleAnimation(
                            // verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: PendingInternshipsContainer(
                                ctx: context,
                                title: internships[i]['title'],
                                field: internships[i]['field'],
                                img: internships[i]['image'],
                                duration: internships[i]['duration'],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
