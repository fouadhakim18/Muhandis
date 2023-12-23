import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/controllers/auth_controller.dart';
import 'package:muhandis/pages/auth/documents.dart';
import 'package:muhandis/widgets/button.dart';

class InterestSelectionPage extends StatefulWidget {
  @override
  _InterestSelectionPageState createState() => _InterestSelectionPageState();
}

class _InterestSelectionPageState extends State<InterestSelectionPage> {
  final controller = Get.find<AuthController>();

  final List<String> techInterests = [
    'Mobile App Development',
    'Web Development',
    'Artificial Intelligence',
    'Data Science',
    'Cybersecurity',
    'Cloud Computing',
    'Internet of Things (IoT)',
    'Augmented Reality (AR)',
    'Virtual Reality (VR)',
    'Machine Learning',
    'Blockchain Technology',
    'User Experience (UX) Design',
    'Robotics',
    'Game Development',
    'DevOps',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: null,
          ),
          actions: [
            TextButton(
              onPressed: null,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xffDEE0E7),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Interests',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Let everyone know what you’re interested in by adding it to your profile',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: techInterests.map((interest) {
                        return GestureDetector(
                          onTap: () {
                            if (controller.selectedInterests
                                .contains(interest)) {
                              controller.selectedInterests.remove(interest);
                            } else {
                              controller.selectedInterests.add(interest);
                              print(controller.selectedInterests);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: controller.selectedInterests
                                      .contains(interest)
                                  ? Color(0xffDEE0E7).withOpacity(0.5)
                                  : null,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0xffDEE0E7),
                                width: 2.0,
                              ),
                            ),
                            child: Text(
                              interest,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: Button(
              text: "Continue",
              clicked: () {
                // Get.to(() => DocumentPage());
                controller.addInterests();
              }),
        ));
  }
}
