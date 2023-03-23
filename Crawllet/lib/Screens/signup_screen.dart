// ignore_for_file: file_names

import 'package:crawllet/Components/login_screen_component.dart';
import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/utils/firebase_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Theme/font_sizes.dart';
import '../Theme/main_colors.dart';
import '../Theme/spacing.dart';
import '../Controllers/signup_screen_controller.dart';
import 'navigation_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.lazyPut(() => SignupScreenController());

    return LoginScreenComponent(
        mainwidget: Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.3,
          child: Column(
            children: [
              Center(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(FontAwesomeIcons.arrowLeft,
                            color: MainColors.textColor)),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Wallet App",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.lg,
                              color: MainColors.textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Spacing.xxl),
                child: Center(
                  child: Text(
                    "Sign Up",
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
                          "Name",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.sm,
                              color: MainColors.headingColor),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        style: TextStyle(
                            fontFamily: "rockwell",
                            fontSize: FontSizes.md,
                            color: MainColors.foregroundColor),
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(
                                fontFamily: "rockwell",
                                fontSize: FontSizes.sm,
                                color: MainColors.foregroundColor
                                    .withOpacity(0.5)),
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
                          "Email",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.sm,
                              color: MainColors.headingColor),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (e) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(e);
                          if (emailValid == true) {
                            // add get
                          }
                        },
                        style: TextStyle(
                            fontFamily: "rockwell",
                            fontSize: FontSizes.md,
                            color: MainColors.foregroundColor),
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                                fontFamily: "rockwell",
                                fontSize: FontSizes.sm,
                                color: MainColors.foregroundColor
                                    .withOpacity(0.5)),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: Spacing.sm),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: MainColors.foregroundColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: BorderSide(
                                    width: 1,
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
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                            fontFamily: "rockwell",
                            fontSize: FontSizes.sm,
                            color: MainColors.foregroundColor),
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                                fontFamily: "rockwell",
                                fontSize: FontSizes.sm,
                                color: MainColors.foregroundColor
                                    .withOpacity(0.5)),
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
                        padding: EdgeInsets.only(top: Spacing.md),
                        child: Center(
                          child: Obx(
                            () => TextButton(
                                onPressed: () async {
                                  try {
                                    if (nameController.text.isNotEmpty &&
                                        emailController.text.isNotEmpty &&
                                        passwordController.text.isNotEmpty &&
                                        passwordController.text.length > 6) {
                                      Get.find<SignupScreenController>()
                                          .changeIsLoadingStarted(true);

                                      await FirebaseFunctions().signup(
                                        nameController.text.trim(),
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                      );
                                      if (FirebaseAuth.instance.currentUser!.uid
                                          .isNotEmpty) {
                                        Get.offAll(
                                            const NavigationScreen(num: 0));
                                      }
                                    } else {
                                      Get.find<SignupScreenController>()
                                          .changeIsLoadingStarted(false);
                                      Get.snackbar(
                                        "Empty Fields ",
                                        "Empty Fields or Passwod is less then 6 letters",
                                      );
                                    }
                                  } catch (e) {
                                    Get.find<SignupScreenController>()
                                        .changeIsLoadingStarted(false);
                                    Get.snackbar(
                                      "An Error Occurred $e",
                                      "Please Check You Connection and try again",
                                    );
                                  }
                                },
                                child: Container(
                                    width: size.width * 0.7,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        color:
                                            Get.find<SignupScreenController>()
                                                    .isLoadingStarted
                                                    .value
                                                ? MainColors.drawingFillColor
                                                : MainColors.foregroundColor),
                                    child: Center(
                                        child:
                                            Get.find<SignupScreenController>()
                                                    .isLoadingStarted
                                                    .value
                                                ? Image.asset(
                                                    "assets/gifs/loading.gif")
                                                : Text(
                                                    "Sign Up",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Already Registered?",
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
                            Get.toNamed(AppRoutes.loginScreen);
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                fontFamily: "harlow",
                                fontSize: FontSizes.md,
                                color: MainColors.headingColor),
                          )),
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
