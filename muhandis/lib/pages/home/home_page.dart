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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Obx(
            () => Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(color: Color.fromARGB(255, 43, 0, 255))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedTabBarIndex.value = 0;
                      },
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              // controller.selectedTabBarIndex.value == 0
                              // ? Color.fromARGB(255, 162, 148, 234)
                              //     .withOpacity(0.1)
                              // :
                              Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                        child: Center(
                          child: Text(
                            'Internships',
                            style: TextStyle(
                                fontSize:
                                    controller.selectedTabBarIndex.value == 0
                                        ? 17.0
                                        : 16,
                                fontWeight:
                                    controller.selectedTabBarIndex.value == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: controller.selectedTabBarIndex.value == 0
                                    ? Color.fromARGB(255, 43, 0, 255)
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedTabBarIndex.value = 1;
                      },
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                        ),
                        child: Center(
                          child: Text(
                            'Courses',
                            style: TextStyle(
                                fontSize:
                                    controller.selectedTabBarIndex.value == 1
                                        ? 17.0
                                        : 16,
                                fontWeight:
                                    controller.selectedTabBarIndex.value == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: controller.selectedTabBarIndex.value == 1
                                    ? Color.fromARGB(255, 43, 0, 255)
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    // width: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/images/Search (2).png",
                        ),
                        border: InputBorder.none,
                        // focusedBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: AppColors.mainColor)),
                        hintText: 'Search...',
                        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor),
                    child: InkWell(
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          barrierColor: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return const FractionallySizedBox(
                              heightFactor: 0.68,
                              child: Body(),
                            );
                          }),
                      child: Image.asset("assets/images/Filter_big (1).png"),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('internships')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<Internship> internships = snapshot.data!.docs
                    .map(
                        (DocumentSnapshot doc) => Internship.fromFirestore(doc))
                    .toList();
                print("yessss");
                print(internships.length);
                for (var i = 1; i <= internships.length; i++) {
                  internships[i - 1].images = ["assets/images/home${i}.jpg"];
                }
                return PageView.builder(
                  itemCount: internships.length,
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          height: 470,
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
                                      image:
                                          AssetImage(internships[i].images[0]),
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
                                                  internships[i].title,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      // letterSpacing: 4,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  internships[i].duration,
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
                                                      internships[i].location!,
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
                        Positioned(
                          bottom: 0,
                          // right: 100,
                          left: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FirestoreServices().addToFavorites(
                                      snapshot.data!.docs[i].id,
                                      internships[i].title,
                                      internships[i].field,
                                      internships[i].field,
                                      internships[i].images[0]);
                                },
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfff8F8F8),
                                  ),
                                  child: Icon(
                                    Icons.star_rounded,
                                    color: Colors.amberAccent,
                                    size: 31,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              GestureDetector(
                                onTap: () {
                                  FirestoreServices().applyInternship(
                                      snapshot.data!.docs[i].id,
                                      internships[i].title,
                                      internships[i].field,
                                      internships[i].duration,
                                      internships[i].images[0]);
                                },
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfff8F8F8),
                                  ),
                                  child: Image.asset(
                                    "assets/images/Group.png",
                                    width: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            )),
          ]),
        ),
      ),
    );
  }
}
