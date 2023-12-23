import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:muhandis/pages/challenges/challenge.dart';

class ChallengesTypes extends StatelessWidget {
  const ChallengesTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> domains = [
      'Mobile',
      'Web',
      'Security',
      'Machine Learning',
      'Data Science',
      'Cloud Computing',
      "Ui/Ux Design",
      "Game development"
    ];
    final List<String> images = [
      "assets/images/mobile.jpeg",
      "assets/images/web.jpg",
      "assets/images/security.jpg",
      "assets/images/machine.jpg",
      "assets/images/datas.jpg",
      "assets/images/cloud.jpg",
      "assets/images/design.jpg",
      "assets/images/game.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Challenges',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: AnimationLimiter(
          child: GridView.builder(
            itemCount: domains.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
            ),
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 400),
                columnCount: 2,
                child: ScaleAnimation(
                  scale: 0.5, // Initial scale value
                  child: FadeInAnimation(
                    child: GestureDetector(
                        onTap: () {
                          // Add action when a domain is tapped
                          print('Tapped ${domains[index]}');
                          Get.to(() => ChallengePage(title: domains[index]));
                          // Navigate to challenge details, etc.
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.0),
                                color: Colors.black.withOpacity(0.7)),
                            child: Stack(
                              children: [
                                // Display image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(22.0),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(
                                          0.4), // Adjust opacity for darkness level
                                      BlendMode.srcATop,
                                    ),
                                    child: Image.asset(
                                      images[index],
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Display internship information
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    // color: Colors.black.withOpacity(0.7), // Darken the background color
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Display name with ellipsis
                                        Text(
                                          domains[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )), // Replace this with your custom widget
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
