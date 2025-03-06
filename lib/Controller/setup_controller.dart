import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupController extends GetxController {
  final TextEditingController password = TextEditingController();

  @override
  void onClose() {
    password.dispose();
    super.onClose();
  }
}
