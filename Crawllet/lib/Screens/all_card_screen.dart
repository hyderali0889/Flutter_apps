import 'package:crawllet/Components/main_component.dart';
import 'package:crawllet/Controllers/all_cards_controller.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:crawllet/Theme/spacing.dart';
import 'package:crawllet/utils/firebase_functions.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_month_year_picker/simple_month_year_picker.dart';
import '../Components/home_card.dart';
import '../Models/firebase_card_model.dart';
import 'navigation_screen.dart';

class AllCards extends StatefulWidget {
  const AllCards({Key? key}) : super(key: key);

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  TextEditingController cardName = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController cardCompany = TextEditingController();
  TextEditingController cardVCS = TextEditingController();
  dynamic userdata;

  @override
  void dispose() {
    super.dispose();
    cardName.dispose();
    cardNum.dispose();
    cardCompany.dispose();
    cardVCS.dispose();
  }

  @override
  void initState() {
    super.initState();
    Get.put<AllCardsController>(AllCardsController());

    getFirestoreData();
  }

  getFirestoreData() async {
    dynamic carddat = await FirebaseFunctions().getUserCardData();
    if (mounted && carddat != null) {
      setState(() {
        userdata = carddat;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AllCardsController controller = Get.find<AllCardsController>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MainColors.foregroundColor,
      body: MainComponent(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Text(
                    " Cards ",
                    style: TextStyle(
                        fontSize: FontSizes.headingSize,
                        fontFamily: "Harlow",
                        color: MainColors.headingColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 10.0),
              child: Text(
                " All Cards ",
                style: TextStyle(
                    fontSize: FontSizes.headingSize,
                    fontFamily: "Harlow",
                    color: MainColors.backgroundColors),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: userdata != null
                        ? SizedBox(
                            width: size.width * 0.9,
                            height: size.height * 0.58,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                itemCount: userdata.docs.length + 1,
                                itemBuilder: (context, index) {
                                  if (index != 0) {
                                    if (index == userdata.docs.length) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: TextButton(
                                          onPressed: () {
                                            showBottomSheet(
                                                context, controller);
                                          },
                                          child: Container(
                                            height: 180,
                                            width: size.width * 0.8,
                                            decoration: BoxDecoration(
                                                color: MainColors.boxFillColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14.0)),
                                            child: Icon(
                                              Icons.add,
                                              size: FontSizes.md,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: HomeCard()
                                            .creditCard(userdata.docs[index]));
                                  }
                                  return Container();
                                }),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                            color: MainColors.boxFillColor,
                          )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController control, String text,
      TextInputType val, int maxlines) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxlines),

        ],
        controller: control,
        keyboardType: val,
        style: TextStyle(
            fontFamily: "rockwell",
            fontSize: FontSizes.md,
            color: MainColors.foregroundColor),
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
                fontFamily: "rockwell",
                fontSize: FontSizes.sm,
                color: MainColors.foregroundColor.withOpacity(0.5)),
            contentPadding: EdgeInsets.symmetric(horizontal: Spacing.sm),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide(color: MainColors.foregroundColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide(color: MainColors.foregroundColor))),
      ),
    );
  }

  showBottomSheet(context, controller) {
    SlideDialog.showSlideDialog(
      context: context,
      backgroundColor: MainColors.backgroundColors,
      pillColor: Colors.yellow,
      transitionDuration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 10.0),
                  child: Text(
                    "Enter Card Details",
                    style: TextStyle(
                        fontSize: FontSizes.headingSize,
                        fontFamily: "Harlow",
                        color: MainColors.headingColor),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80,
                    child: textField(cardName, "Enter Card Holder's Name",
                        TextInputType.name, 64)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80,
                    child: textField(cardNum, "Enter Card Number",
                        TextInputType.number, 14)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 80,
                    child: textField(cardCompany, "Enter Card Company",
                        TextInputType.name, 64)),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                            onPressed: () async {
                              await SimpleMonthYearPicker
                                  .showMonthYearPickerDialog(
                                titleFontFamily: "Harlow",
                                context: context,
                              ).then((value) {
                                controller.addDate(value);
                              });
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  color: MainColors.foregroundColor,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Center(
                                  child: Text(
                                "Choose Exp Date",
                                style:
                                    TextStyle(color: MainColors.headingColor),
                              )),
                            )),
                      ),
                    ),
                    SizedBox(
                        width: 180,
                        height: 80,
                        child: textField(
                            cardVCS, "Card's CVC", TextInputType.name, 3)),
                  ],
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(60, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        onPressed: () async {
                          try {
                            if (cardName.text.isNotEmpty &&
                                cardCompany.text.isNotEmpty &&
                                controller.date.value != null &&
                                cardVCS.text.isNotEmpty  &&
                                cardNum.text.isNotEmpty ) {
                              controller.changeisloading(true);
                              await FirebaseFunctions().addDatatoFirestore(
                                  CardModel(
                                      cardName.text.trim(),
                                      cardNum.text.trim(),
                                      cardCompany.text.trim(),
                                      controller.date.value.toString(),
                                      cardVCS.text.trim()));

                              controller.changeisloading(false);
                              Get.snackbar("Uploaded", "Upload Complete");
                              Get.offAll(const NavigationScreen(num: 1));
                            } else {
                              Get.snackbar("Error",
                                  "All Fields Are Required, Please Double check all your credentials");
                            }
                          } catch (e) {
                            Get.snackbar(
                                "Error Occurred", " Please Try Again  ");
                            controller.changeisloading(false);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: controller.isLoading.value
                                  ? MainColors.drawingFillColor
                                  : MainColors.foregroundColor,
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                            child: controller.isLoading.value
                                ? Image.asset("assets/gifs/loading.gif")
                                : Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontFamily: "harlow",
                                        fontSize: FontSizes.lg,
                                        color: MainColors.headingColor),
                                  ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
