import 'package:crawllet/Constants/firebase_conts.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';

class HomeCard {
  creditCard(data) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          color: MainColors.textColor,
          borderRadius: BorderRadius.circular(14.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  "Card Details".toUpperCase(),
                  style: TextStyle(
                      color: MainColors.foregroundColor,
                      fontSize: 15,
                      fontFamily: "rockwell"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "${data[FirebaseConsts().cardNum]}".toUpperCase(),
                  style: TextStyle(
                      color: MainColors.headingColor,
                      fontSize: 26,
                      fontFamily: "Harlow"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${data[FirebaseConsts().cardName]}",
                  style: TextStyle(
                      color: MainColors.headingColor,
                      fontSize: 26,
                      fontFamily: "Harlow"),
                ),
                Image.asset(
                  "assets/icons/chip.png",
                  width: 40,
                  height: 40,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${data[FirebaseConsts().cardExp]}".substring(0, 7),
                  style: TextStyle(
                      color: MainColors.headingColor,
                      fontSize: 19,
                      fontFamily: "Harlow"),
                ),
                cardIcon(data[FirebaseConsts().cardCompany]),
              ],
            ),
          )
        ],
      ),
    );
  }

  cardIcon(data) {
    if (data == "Visa" || data == "visa" || data == "VISA") {
      return Image.asset(
        "assets/icons/visa.png",
        width: 25,
        height: 25,
      );
    } else if (data == "mastercard" ||
        data == "Mastercard" ||
        data == "MASTERCARD") {
      return Image.asset(
        "assets/icons/mc.png",
        width: 25,
        height: 25,
      );
    } else {
      return Image.asset(
        "assets/icons/others.png",
        width: 25,
        height: 25,
      );
    }
  }
}
