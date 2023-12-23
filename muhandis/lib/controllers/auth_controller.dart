import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:muhandis/pages/auth/documents.dart';
import 'package:muhandis/pages/home/home.dart';
import 'package:muhandis/pages/home/home_page.dart';

import '../consts/firebase_consts.dart';
import '../pages/auth/interests.dart';

class AuthController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  var selectedInterests = [].obs;

  // final homeController = Get.put(HomeController());
  // Login Method

  Future<UserCredential?> login(formKey) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      UserCredential? userCredential;
      try {
        userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        currentUser = userCredential.user;

        // Utils.showToast("logged in");
        print(currentUser!.email);
        Get.offAll(() => const Home());
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        // Utils.showToast(e.message.toString());

        isLoading.value = false;
      }
      // homeController.currentNavIndex.value = 0;

      return userCredential;
    }
  }

// Signup Method

  Future<UserCredential?> signUp(
      {required firstName,
      required lastName,
      required email,
      required phone,
      required password,
      // required context,
      required formKey}) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      UserCredential? userCredential;
      try {
        userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        currentUser = userCredential.user;
        await storeUserData(
            firstName: firstName,
            lastName: lastName,
            password: password,
            email: email);
        Get.offAll(() => InterestSelectionPage());
        // Utils.showToast("signed up");
        print("user created successfully");
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        print("fail!!!!");
        // Utils.showToast(e.message.toString());
      }
      // homeController.currentNavIndex.value = 0;
      // Get.to(() => Home());
      return userCredential;
    } else {
      print("form not validated");
    }
  }

  // Storing Data Method

  storeUserData(
      {required firstName,
      required lastName,
      required password,
      required email}) async {
    DocumentReference store =
        firestore.collection("users").doc(currentUser!.uid);
    store.set({
      "Id": currentUser!.uid,
      "FirstName": firstName,
      "LastName": lastName,
      "Password": password,
      "Email": email,
      "ImageUrl": "",
    });
  }

  addInterests() {
    print(selectedInterests);
    print(selectedInterests.isNotEmpty);
    if (selectedInterests.isNotEmpty) {
      DocumentReference store =
          firestore.collection("users").doc(currentUser!.uid);
      store.update({
        "Interests": selectedInterests,
      });
      print("saved successfully");
    }
    Get.to(() => DocumentPage());
  }

  // Signout Method
  singOut(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      // Utils.showToast(e.toString());
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  Future<void> uploadCertificates(String userID) async {
    List<File> files = []; // Store selected files using file_picker
    List<String> downloadURLs = [];

    for (var file in files) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('certificates/$userID/${file.path}');
      await ref.putFile(file);
      String downloadURL = await ref.getDownloadURL();
      downloadURLs.add(downloadURL);
    }

    // Store references in Firestore
    CollectionReference certificatesCollection =
        FirebaseFirestore.instance.collection('certificates');
    for (var url in downloadURLs) {
      await certificatesCollection.add({
        'userID': userID,
        'downloadURL': url,
        // Add more metadata if needed
      });
    }
  }
}
