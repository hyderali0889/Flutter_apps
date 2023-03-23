// ignore_for_file: file_names

import 'package:crawllet/Components/login_screen_component.dart';
import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/utils/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Theme/font_sizes.dart';
import '../Theme/main_colors.dart';
import '../Theme/spacing.dart';
import '../Controllers/forgot_screen_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgotScreenController());

    return LoginScreenComponent(mainwidget: signUpScreenWidget(context));
  }
}

Widget signUpScreenWidget(
  context,
) {
  Size size = MediaQuery.of(context).size;
  TextEditingController emailController = TextEditingController();
  return Column(
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
                  "Reset Password",
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
                              onPressed: () async {
                                try {
                                  if (emailController.text.isNotEmpty) {
                                    Get.find<ForgotScreenController>()
                                        .changeIsLoadingStarted(true);
                                    await FirebaseFunctions().forgotPassword(
                                        emailController.text.trim());
                                    Get.offNamed(AppRoutes.loginScreen);
                                  } else {
                                    Get.find<ForgotScreenController>()
                                        .changeIsLoadingStarted(false);
                                    Get.snackbar(
                                      "Error Ocurred",
                                      " Empty Fields ",
                                    );
                                  }
                                } catch (e) {
                                  Get.find<ForgotScreenController>()
                                      .changeIsLoadingStarted(false);
                                  Get.snackbar(
                                    "Error Ocurred",
                                    "Please Check Your Connection ",
                                  );
                                }
                              },
                              child: Container(
                                  width: size.width * 0.7,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      color: Get.find<ForgotScreenController>()
                                              .isLoadingStarted
                                              .value
                                          ? MainColors.drawingFillColor
                                          : MainColors.foregroundColor),
                                  child: Center(
                                      child: Get.find<ForgotScreenController>()
                                              .isLoadingStarted
                                              .value
                                          ? Image.asset(
                                              "assets/gifs/loading.gif")
                                          : Text(
                                              "Send Link",
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
            ],
          ),
        ),
      ),
    ],
  );
}
