import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/pages/internships_history/pending_internships.dart';

import '../../controllers/home_controller.dart';

class InternshipsHistory extends StatefulWidget {
  const InternshipsHistory({super.key});

  @override
  State<InternshipsHistory> createState() => _InternshipsHistoryState();
}

class _InternshipsHistoryState extends State<InternshipsHistory> {
  late int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final scheduleWidgets = [
      PendingInternships(),
    ];
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My History',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
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
                        color: Colors.white,
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
                        color:
                            //  controller.selectedTabBarIndex.value == 1
                            // ? Color.fromARGB(255, 162, 148, 234)
                            //     .withOpacity(0.1)
                            // :
                            Colors.white,
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
        padding: const EdgeInsets.only(top: 10),
        child: AnimationLimiter(
          child: ListView(
            children: [scheduleWidgets[_buttonIndex]],
          ),
        ),
      ),
    );
  }
}
