import 'dart:ffi';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/consts/firebase_consts.dart';
import 'package:muhandis/controllers/home_controller.dart';
import 'package:muhandis/models/internship.dart';
import 'package:muhandis/pages/auth/documents.dart';
import 'package:muhandis/pages/filter/body.dart';
import 'package:muhandis/pages/home/more_details.dart';
import 'package:muhandis/services/firestore_services.dart';

class FilteredInternships extends StatefulWidget {
  final String location;
  const FilteredInternships({
    super.key,
    required this.location,
  });

  @override
  State<FilteredInternships> createState() => _FilteredInternshipsState();
}

class _FilteredInternshipsState extends State<FilteredInternships> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Filtered Internships',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      )),
      body: FutureBuilder<List<Internship>>(
        future: FirestoreServices().getFilteredInternships(widget.location),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No internships found.'));
          } else {
            return PageView.builder(
              itemCount: snapshot.data!.length,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      height: 550,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => MoreDeatils());
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/home1.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color.fromARGB(255, 31, 25, 106)
                                        .withOpacity(0.5),
                                  ),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Column(children: [
                                            Text(
                                              snapshot.data![i].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  // letterSpacing: 4,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data![i].duration,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  widget.location!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '\$5000',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                )
                                              ],
                                            )
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
