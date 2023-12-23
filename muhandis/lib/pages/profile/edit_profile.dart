import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';
import '../../controllers/edit_profile_controller.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _ProfileState();
}

class _ProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                      controller.nameController,
                      'Name',
                      Icons.person_outlined,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      controller.emailController,
                      'Email',
                      Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller.phoneController,
                      'Phone',
                      Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller.phoneController,
                      'Adress',
                      Icons.location_on,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFieldWidget(
                      controller.phoneController,
                      'University',
                      Icons.school,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "About you",
                      style: TextStyle(color: AppColors.mainColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        maxLines: null, // set to null to allow multiple lines
                        controller: controller.aboutController,
                        maxLength: 130,
                        decoration: const InputDecoration(
                          hintText: "Write something about you",
                          hintStyle: TextStyle(fontSize: 13),
                          hintMaxLines: 16,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Button('Update', () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      updateUserData();
                    }, AppColors.mainColor),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFieldWidget(
    TextEditingController controller,
    String title,
    IconData iconData,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.mainColor),
        ),
        const SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: title,
              hintStyle:
                  const TextStyle(color: AppColors.fontGrey, fontSize: 13),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.mainColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget Button(String title, Function onPressed, Color color) {
    return MaterialButton(
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: color,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> updateUserData() async {
    try {
      final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('employees')
          .doc(currentUserUid)
          .update({
        'name': controller.nameController.text,
        'email': controller.emailController.text,
        'phone': controller.phoneController.text,
        'aboutEmployee': controller.aboutController.text,
      });
    } catch (e) {}
  }
}
