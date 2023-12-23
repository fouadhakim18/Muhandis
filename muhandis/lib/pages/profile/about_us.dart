import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Image.asset("assets/images/Asset 6.png"),
                ),
                Center(
                  child: Text(
                    "The student-centric application is a tailored platform empowering aspiring interns in their pursuit of professional growth. Through intuitive profile creation, students showcase their educational background, skills, and aspirations. The app facilitates seamless exploration of a diverse array of internships, offering filtering options to align opportunities with students' preferences. It streamlines the application process, ensuring clear tracking of applied positions and deadlines. Furthermore, it promotes continuous learning by recommending courses and skill tests that complement students' profiles. Direct communication channels enable interaction with recruiters, fostering transparency. With personalized notifications and a user-friendly interface, the app strives to offer a holistic, secure, and engaging experience, aimed at nurturing students' career aspirations and skill development.",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
