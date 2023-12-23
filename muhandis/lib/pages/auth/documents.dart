import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/firebase_consts.dart';
import 'package:muhandis/controllers/auth_controller.dart';
import 'package:muhandis/pages/home/home.dart';
import 'package:muhandis/pages/home/home_page.dart';

import '../../consts/colors.dart';
import '../../widgets/button.dart';

PlatformFile? pickedFile;
UploadTask? uploadTask;

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  List<Widget> documentContainers = [
    DocumentContainer(title: 'Upload Certificate'),
    DocumentContainer(title: 'Upload CV'),
  ];

  final controller = Get.put(AuthController());

  late FilePickerResult? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Document Upload',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 1.0,
            children: [
              ...documentContainers,
              InkWell(
                onTap: () => setState(() {
                  documentContainers
                      .add(DocumentContainer(title: 'Add Document'));
                }),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12.0),
                  color: AppColors.redColor,
                  dashPattern: [15, 8],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text("Add Documents")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: Button(
              text: "Continue",
              clicked: () {
                Get.to(() => Home());
              }),
        ));
  }
}

class DocumentContainer extends StatelessWidget {
  final String title;

  DocumentContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        print("file==========rfierh=====");

        print(pickedFile);

        pickedFile = result.files.first;
        print("file===============");
        print(pickedFile);

        final path = "certificates/${pickedFile!.name}";
        final file = File(pickedFile!.path!);
        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(file);
        final snapshot = await uploadTask!.whenComplete(() => {});
        final urlDownload = await snapshot.ref.getDownloadURL();
        print("Download Url ${urlDownload}");
        await FirebaseFirestore.instance.collection('certificates').add({
          'userId': currentUser!.uid,
          'fileName': pickedFile!.name,
          'downloadURL': urlDownload,
        });
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12.0),
        color: AppColors.mainColor,
        dashPattern: [15, 8],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(title)),
          ],
        ),
      ),
    );
  }
}
