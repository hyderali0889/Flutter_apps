import 'package:crawllet/Components/main_component.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:crawllet/utils/api_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoRatesScreen extends StatefulWidget {
  const CryptoRatesScreen({super.key});

  @override
  State<CryptoRatesScreen> createState() => _CryptoRatesScreenState();
}

class _CryptoRatesScreenState extends State<CryptoRatesScreen> {
  dynamic apiData;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      List<dynamic> dat = await ApiCall().fetchCryptoData();

      if (mounted && dat.isNotEmpty) {
        setState(() {
          apiData = dat;
        });
      }
    } catch (e) {
      Get.snackbar("Error", "Internet Not available $e");
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 40.0, left: 10.0),
                      child: Text(
                        "All Cryptos",
                        style: TextStyle(
                            fontSize: FontSizes.headingSize,
                            fontFamily: "Harlow",
                            color: MainColors.headingColor),
                      ),
                    ),
                  ),
                  apiData != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.8,
                                width: size.width,
                                child: ListView.builder(
                                    itemCount: apiData.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Container(
                                                height: 100,
                                                width: size.width * 0.9,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color:
                                                        MainColors.boxFillColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0),
                                                      child: Text(
                                                        "${apiData[index]["name"]}",
                                                        style: TextStyle(
                                                            color: MainColors
                                                                .headingColor,
                                                            fontSize:
                                                                FontSizes.lg,
                                                            fontFamily:
                                                                "rockwell"),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15.0),
                                                      child: Text(
                                                        "\$ ${apiData[index]["current_price"]}"
                                                            .substring(0, 5),
                                                        style: TextStyle(
                                                            color: MainColors
                                                                .foregroundColor,
                                                            fontSize:
                                                                FontSizes.lg,
                                                            fontFamily:
                                                                "rockwell"),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: size.height,
                          width: size.width,
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: MainColors.backgroundColors)),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
