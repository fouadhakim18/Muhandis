import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/pages/auth/signup_page.dart';
import 'package:muhandis/widgets/button.dart';
import 'package:muhandis/widgets/text_form_field.dart';

import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final loginformKey = GlobalKey<FormState>();

    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Center(child: Image.asset("assets/images/Asset 6.png")),
                      SizedBox(
                        height: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back , ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            "Sign in to continue your journey",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                          key: loginformKey,
                          child: Column(
                            children: [
                              TextFormFieldd(
                                  controller: controller.emailController,
                                  prefixIcon: Icons.email_outlined,
                                  hint: "Email"),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormFieldd(
                                  controller: controller.passwordController,
                                  prefixIcon: Icons.fingerprint_outlined,
                                  hint: "Password"),
                              SizedBox(
                                height: 10,
                              ),
                              const InkWell(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Forgot password ? ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.mainColor),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Button(
                        text: "Sign In",
                        clicked: () {
                          controller.login(loginformKey);
                        },
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Button(
                        text: "Create Account",
                        clicked: () {
                          Get.to(() => SignUpPage());
                        },
                        color: AppColors.whiteColor,
                        textColor: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
