import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/models/data.dart';
import 'package:muhandis/pages/auth/login_page.dart';
import 'package:muhandis/pages/profile/about_us.dart';
import 'package:muhandis/pages/profile/edit_profile.dart';

import '../../consts/colors.dart';
import '../../models/internship.dart';
import '../../widgets/intro_widget.dart';
import '../internships_history/internships_history.dart';
import 'edit_document.dart';
import 'profile.dart';
import 'profile_menu.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();

  String? currentCountry;
  String? currentState;
  String? currentCity;
  String? pic;

  @override
  void initState() {
    super.initState();
    // _loadUserData();
  }

  void addInternshipsToFirestore() async {
    print("adding====================");
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    for (var internship in internshipsList) {
      await firestore.collection('internships').add(internship.toMap());
    }

    print('Internships added to Firestore');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                children: [
                  blueIntroWidgetWithoutLogos(context),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {},
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profile.jpg",
                          width: 100,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ProfileMenu(
              text: "Edit Profile",
              icon: Icons.edit,
              press: () {
                Get.to(() => EditProfile());
              },
            ),
            ProfileMenu(
              text: "Edit Documents",
              icon: Icons.description,
              press: () {
                // await Future.delayed(const Duration(milliseconds: 150));
                Get.to(() => EditDocument());
              },
            ),
            ProfileMenu(
              text: "About Us",
              icon: Icons.description,
              press: () {
                // await Future.delayed(const Duration(milliseconds: 150));
                Get.to(() => AboutUs());
              },
            ),
            // ProfileMenu(
            //   text: "Internship History",
            //   icon: Icons.work,
            //   press: () => {Get.to(() => InternshipsHistory())},
            // ),
            // ProfileMenu(
            //   text: "Courses History",
            //   icon: Icons.school,
            //   press: () {
            //     addInternshipsToFirestore();
            //   },
            // ),
            ProfileMenu(
                text: "Log Out",
                icon: Icons.logout_outlined,
                color: AppColors.redColor,
                press: () => signOut()),
          ],
        ),
      ),
    );
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      Get.to(() => const LoginPage());
    } catch (e) {
      print(e.toString());
    }
  }
}
