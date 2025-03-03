import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class MathController extends GetxController {
  RxString historyText = ''.obs;
  RxString displayText = ''.obs;

  void addText(String text) {
    if (text.toLowerCase() == 'c') {
      clearCalculator();
      return;
    }

    if (text.contains(RegExp(r'\u00B1'))) {
      return;
    }
    final RegExp regex = RegExp(r'[\u00B1\u00F7%\u00D7\-\+]');
    //  length text without last symbol
    final int lengthText = displayText.value.length - 1;

    if (text == '=') {
      final String lastCharacterDisplay =
          displayText.value.substring(lengthText);
      if (lastCharacterDisplay.contains(regex)) {
        return;
      }
      resultSet();
      return;
    }

    if (text.contains(regex)) {
      if (displayText.value.isEmpty) {
        return;
      }
      final String lastCharacterDisplay =
          displayText.value.substring(lengthText);
      if (lastCharacterDisplay.contains(regex)) {
        final displayTextReplaceLastSymbol =
            displayText.value.substring(0, lengthText);
        displayText.value = displayTextReplaceLastSymbol + text;
        return;
      }
    }
    displayText.value += text;
  }

  void clearCalculator() {
    historyText.value = '';
    displayText.value = '';
  }

  void resultSet() {
    final textConvertMath = displayText.value
        .replaceAll(RegExp(r'\u00F7'), '/')
        .replaceAll(RegExp(r'\u00D7'), '*');

    final Parser p = Parser();
    final Expression exp = p.parse(textConvertMath);
    final ContextModel cm = ContextModel();
    historyText.value = displayText.value;
    displayText.value = exp.evaluate(EvaluationType.REAL, cm).toString();
  }
}
