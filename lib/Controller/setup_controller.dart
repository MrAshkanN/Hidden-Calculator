import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupController extends GetxController {
  final TextEditingController password = TextEditingController();

  @override
  void onClose() {
    password.dispose();
    super.onClose();
  }

  void addNumber(String text) {
    if (text == 'remove') {
      if (password.text.isEmpty) {
        return;
      }
      password.text = password.text.substring(0, password.text.length - 1);
      return;
    }
    password.text += text.toString();
  }

  void removeAll() {
    password.text = '';
  }
}
