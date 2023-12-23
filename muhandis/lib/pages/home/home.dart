import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/pages/challenges/challenges_types.dart';
import 'package:muhandis/controllers/home_controller.dart';
import 'package:muhandis/pages/favourites/favorites.dart';
import 'package:muhandis/pages/home/home_page.dart';
import 'package:muhandis/pages/internships_history/internships_history.dart';
import '../profile/profile_settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    List<IconData> icons = [
      Icons.home_rounded,
      Icons.star_rounded,
      Icons.school_rounded,
      Icons.person_rounded
    ];
    final navBody = [
      HomePage(),
      favorites_screen(),
      InternshipsHistory(),
      ProfileSettings()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.emoji_events,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () async {
          Get.to(const ChallengesTypes());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
            itemCount: 4,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                icons[index],
                color: isActive ? AppColors.mainColor : AppColors.lightGrey3,
                size: 28,
              );
            },
            activeIndex: controller.activeIndex.value,
            gapLocation: GapLocation.center,
            onTap: (index) {
              controller.activeIndex.value = index;
            }),
      ),
      body: Obx(() => navBody[controller.activeIndex.value]),
    );
  }
}
