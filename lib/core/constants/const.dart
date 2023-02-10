import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/strings.dart';

class Const {
  static TextStyle large = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      fontFamily: Strings.inter);

  static TextStyle extralarge = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      fontFamily: Strings.inter);

  static TextStyle bold = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      fontFamily: Strings.inter);

  static TextStyle medium = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: Strings.inter);
}

errorSnackbar(String description) {
  Get.snackbar(
    "Oops! something went wrong",
    description,
    shouldIconPulse: true,
    colorText: Colors.white,
    backgroundColor: Colors.red,
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
  );
}

successSnackbar(String description) {
  Get.snackbar(
    "Successful!",
    description,
    shouldIconPulse: true,
    colorText: Colors.white,
    backgroundColor: Colors.green,
    icon: const Icon(
      Icons.check,
      color: Colors.white,
    ),
  );
}
