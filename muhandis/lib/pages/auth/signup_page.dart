import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/controllers/auth_controller.dart';
import 'package:muhandis/widgets/button.dart';
import 'package:muhandis/widgets/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isChecked = false;
  // bool _isPasswordVisible = false;
  final controller = Get.put(AuthController());
  final signUpformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Let's create your account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Form(
                            key: signUpformKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormFieldd(
                                          controller:
                                              controller.firstNameController,
                                          prefixIcon: Icons.person_outline,
                                          hint: "First Name"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormFieldd(
                                          controller:
                                              controller.lastNameController,
                                          prefixIcon: Icons.person_outline,
                                          hint: "Last Name"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormFieldd(
                                    controller: controller.emailController,
                                    prefixIcon: Icons.email_outlined,
                                    hint: "Email"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormFieldd(
                                    controller: controller.phoneController,
                                    prefixIcon: Icons.phone_outlined,
                                    hint: "Phone Number"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormFieldd(
                                    controller: controller.passwordController,
                                    prefixIcon: Icons.fingerprint_outlined,
                                    hint: "Password"),
                                SizedBox(
                                  height: 20,
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
                                const SizedBox(height: 25),
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: AppColors.mainColor,
                                      checkColor: Colors.white,
                                      // fillColor:
                                      //     const MaterialStatePropertyAll(AppColors.mainColor),
                                      value: _isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          _isChecked = value!;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: RichText(
                                          text: const TextSpan(children: [
                                        TextSpan(
                                            text: "I agree to the ",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        TextSpan(
                                            text: "Terms and Conditions",
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                            )),
                                        TextSpan(
                                            text: " & ",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        TextSpan(
                                            text: "Privacy Policy",
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                            )),
                                      ])),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Button(
                                  text: "Create Account",
                                  clicked: () async {
                                    if (_isChecked) {
                                      try {
                                        await controller.signUp(
                                            firstName: controller
                                                .firstNameController.text
                                                .trim(),
                                            lastName: controller
                                                .lastNameController.text
                                                .trim(),
                                            phone: controller
                                                .phoneController.text
                                                .trim(),
                                            email: controller
                                                .emailController.text
                                                .trim(),
                                            password: controller
                                                .passwordController.text
                                                .trim(),
                                            // context: context,
                                            formKey: signUpformKey);
                                      } catch (e) {
                                        //  Utils.showToast(e.toString());
                                      }
                                    }
                                  },
                                  borderColor: _isChecked
                                      ? AppColors.mainColor
                                      : Colors.grey,
                                  color: _isChecked
                                      ? AppColors.mainColor
                                      : Colors.grey,
                                ),
                                const SizedBox(
                                  height: 45,
                                ),
                                // Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have an account ? ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: AppColors.mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
        ));
  }
}
