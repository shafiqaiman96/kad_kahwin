import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHandler {
  static Future<void> showModal(
    String title,
    String subtitle, {
    bool isFailed = false,
  }) async {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(subtitle),
      ),
    );

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.back();
      Get.back();
    });
  }
}
