// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crawllet/Constants/firebase_conts.dart';
import 'package:crawllet/Controllers/firebase_functions_controller.dart';
import 'package:crawllet/Models/firebase_card_model.dart';
import 'package:crawllet/Routes/app_routes.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:get/get.dart';

class FirebaseFunctions {
  int num = 1;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  signup(name, email, password) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user?.updateDisplayName(name);
      firestore.collection(value.user!.uid).doc("User_data").set({
        "id": value.user!.uid,
        "name": name,
        "email": value.user!.email,
      });
    });
  }

  login(email, password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  signout() async {
    await auth.signOut().then((value) {

    Get.offAllNamed(AppRoutes.loginScreen);
    });

  }

  forgotPassword(email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  addDatatoFirestore(CardModel model) {
    Get.put(FirebaseController());
    FirebaseController controller = Get.find<FirebaseController>();
    firestore
        .collection(auth.currentUser!.uid)
        .doc("card_${controller.num}")
        .set({
      FirebaseConsts().cardName: model.cardName,
      FirebaseConsts().cardNum: model.cardNum,
      FirebaseConsts().cardCompany: model.cardCompany,
      FirebaseConsts().cardExp: model.cardExpiry,
      FirebaseConsts().cardVCS: model.cardVCS,
    }).then((value) {
      controller.addADigit();
    });
  }

  getUserCardData() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await firestore.collection(auth.currentUser!.uid).get();
    return data;
  }
}
