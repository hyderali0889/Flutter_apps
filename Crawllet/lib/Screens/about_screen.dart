import 'package:crawllet/Components/main_component.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/firebase_functions.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  dynamic userdata;
  bool isLoading = false;

  changeisLoading(bool dat) {
    setState(() {
      isLoading = dat;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      dynamic data = await FirebaseFunctions().getUserCardData();

      if (mounted && data != null) {
        setState(() {
          userdata = data;
        });
      }
      // print(data.docs[0]["email"]);
    } catch (e) {
      Get.snackbar("Error", "Internet Connection Not available $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MainColors.foregroundColor,
        body: MainComponent(
          widget: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0),
                    child: Text(
                      "Accounts",
                      style: TextStyle(
                          fontSize: FontSizes.headingSize,
                          fontFamily: "Harlow",
                          color: MainColors.headingColor),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0)
                   ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150.0),
                    child: Image.asset("assets/imgs/1.jpeg",
                        width: 150, height: 150 , fit: BoxFit.fill,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                  child: Text(
                    " Your Details ",
                    style: TextStyle(
                        fontSize: FontSizes.headingSize,
                        fontFamily: "Harlow",
                        color: MainColors.backgroundColors),
                  ),
                ),
                userdata != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Name :  ",
                                      style: TextStyle(
                                          fontSize: FontSizes.lg,
                                          fontFamily: "rockwell",
                                          color: MainColors.backgroundColors),
                                    ),
                                    Text(
                                      userdata.docs[0]["name"],
                                      style: TextStyle(
                                          fontSize: FontSizes.lg,
                                          fontFamily: "rockwell",
                                          color: MainColors.headingColor),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Email :  ",
                                      style: TextStyle(
                                          fontSize: FontSizes.lg,
                                          fontFamily: "rockwell",
                                          color: MainColors.backgroundColors),
                                    ),
                                    Text(
                                      userdata.docs[0]["email"],
                                      style: TextStyle(
                                          fontSize: FontSizes.lg,
                                          fontFamily: "rockwell",
                                          color: MainColors.headingColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: size.height * 0.3,
                        width: size.width,
                        child: Center(
                            child: CircularProgressIndicator(
                                color: MainColors.backgroundColors)),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(60, 20),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      onPressed: () {
                        try {
                          FirebaseFunctions().signout();
                          changeisLoading(true);
                        } catch (e) {
                          Get.snackbar(
                              "Error Occurred", " Please Try Again $e ");
                          changeisLoading(false);
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: isLoading
                                ? MainColors.drawingFillColor
                                : MainColors.backgroundColors,
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: isLoading
                              ? Image.asset("assets/gifs/loading.gif")
                              : Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      fontFamily: "harlow",
                                      fontSize: FontSizes.lg,
                                      color: MainColors.headingColor),
                                ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
