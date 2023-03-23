// ignore_for_file: file_names

import 'package:crawllet/Components/login_screen_component.dart';
import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/Controllers/login_screen_controller.dart';

import 'package:crawllet/utils/firebase_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Theme/font_sizes.dart';
import '../Theme/main_colors.dart';
import '../Theme/spacing.dart';
import 'navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => LoginScreenController());
  }

@override
  void dispose() {
     super.dispose();
     emailController.dispose();
     passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return LoginScreenComponent(mainwidget: Column(
    children: [
      SizedBox(
        width: size.width,
        height: size.height * 0.3,
        child: Column(
          children: [
            Center(
              child: Text(
                "Wallet App",
                style: TextStyle(
                    fontFamily: "harlow",
                    fontSize: FontSizes.lg,
                    color: MainColors.textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Spacing.xxl),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontFamily: "harlow",
                      fontSize: FontSizes.headingSize,
                      color: MainColors.drawingFillColor),
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: Spacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // !  Text Fields Starts Here
              SizedBox(
                width: size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Spacing.sm),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: "harlow",
                            fontSize: FontSizes.sm,
                            color: MainColors.headingColor),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      style: TextStyle(
                          fontFamily: "rockwell",
                          fontSize: FontSizes.md,
                          color: MainColors.foregroundColor),
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                              fontFamily: "rockwell",
                              fontSize: FontSizes.sm,
                              color:
                                  MainColors.foregroundColor.withOpacity(0.5)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: Spacing.sm),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  color: MainColors.foregroundColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  color: MainColors.foregroundColor))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          Spacing.sm, Spacing.md, Spacing.sm, Spacing.sm),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: "harlow",
                            fontSize: FontSizes.md,
                            color: MainColors.headingColor),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      style: TextStyle(
                          fontFamily: "rockwell",
                          fontSize: FontSizes.sm,
                          color: MainColors.foregroundColor),
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                              fontFamily: "rockwell",
                              fontSize: FontSizes.sm,
                              color:
                                  MainColors.foregroundColor.withOpacity(0.5)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: Spacing.sm),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  width: 1, color: MainColors.foregroundColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: MainColors.foregroundColor))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Spacing.md),
                      child: Center(
                        child: Obx(
                          () => TextButton(
                              onPressed: Get.find<LoginScreenController>()
                                      .isLoadingStarted
                                      .value
                                  ? null
                                  : () async {
                                      try {
                                        if (emailController.text.isNotEmpty &&
                                            passwordController
                                                .text.isNotEmpty &&
                                            passwordController.text.length >
                                                6) {
                                          Get.find<LoginScreenController>()
                                              .changeIsLoadingStarted(true);
                                          await FirebaseFunctions().login(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                          if (FirebaseAuth.instance.currentUser!
                                              .uid.isNotEmpty) {
                                             Get.offAll(
                                          const NavigationScreen(num: 0) );
                                          }
                                        } else {
                                          Get.find<LoginScreenController>()
                                              .changeIsLoadingStarted(false);
                                          Get.snackbar("Empty fields ",
                                              "Fields are empty or password is less then 6 letters",
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        }
                                      } catch (e) {
                                        Get.find<LoginScreenController>()
                                            .isLoadingStarted(false);
                                        Get.snackbar("An Error Occurred $e",
                                            "Please Check You Connection and try again",
                                            snackPosition:
                                                SnackPosition.BOTTOM);
                                      }
                                    },
                              child: Container(
                                  width: size.width * 0.7,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color: Get.find<LoginScreenController>()
                                              .isLoadingStarted
                                              .value
                                          ? MainColors.drawingFillColor
                                          : MainColors.foregroundColor),
                                  child: Center(
                                      child: Get.find<LoginScreenController>()
                                              .isLoadingStarted
                                              .value
                                          ? Image.asset(
                                              "assets/gifs/loading.gif")
                                          : Text(
                                              "Log In",
                                              style: TextStyle(
                                                  fontFamily: "harlow",
                                                  fontSize: FontSizes.md,
                                                  color: MainColors
                                                      .backgroundColors),
                                            )))),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              // !  Text Fields Ends Here

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(60, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPasswordScreen);
                        },
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.md,
                              color: MainColors.headingColor),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Not yet Signed Up ?",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.md,
                              color: MainColors.foregroundColor),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(60, 20),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Get.toNamed(AppRoutes.signupScreen);
                            },
                            child: Text(
                              " Register",
                              style: TextStyle(
                                  fontFamily: "harlow",
                                  fontSize: FontSizes.md,
                                  color: MainColors.headingColor),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ));
  }
}

