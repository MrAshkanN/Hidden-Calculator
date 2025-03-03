import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_app/Controller/math_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final mathController = Get.put(MathController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            BalanceDisplay(
              title: mathController.historyText.value,
              balance: mathController.displayText.value,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: KeyWords(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class KeyWords extends StatelessWidget {
  KeyWords({super.key});
  final MathController mathController = Get.find<MathController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFcbbfb3),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        childAspectRatio: 1.2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          keyButton(
              word: 'C',
              backgroundMain: const Color(0xFFae5221),
              backgroundSecond: const Color(0xFFdc6526),
              colorText: Colors.white),
          keyButton(
              word: '\u00B1',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
          keyButton(
              word: '%',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
          keyButton(
              word: '\u00F7',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
          keyButton(word: '7'),
          keyButton(word: '8'),
          keyButton(word: '9'),
          keyButton(
              word: '\u00D7',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
          keyButton(word: '4'),
          keyButton(word: '5'),
          keyButton(word: '6'),
          keyButton(
              word: '-',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
          keyButton(word: '1'),
          keyButton(word: '2'),
          keyButton(word: '3'),
          keyButton(
              word: '+',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
          const SizedBox(),
          keyButton(word: '0'),
          keyButton(word: '.'),
          keyButton(
              word: '=',
              backgroundMain: const Color(0xFFe29647),
              backgroundSecond: const Color(0xFFeab070),
              colorText: Colors.white),
        ],
      ),
    );
  }

  Widget keyButton(
      {required word,
      backgroundMain = const Color(0xFFe1d6c7),
      backgroundSecond = const Color(0xFFf3f1ed),
      colorText = Colors.black}) {
    final RxBool isPress = false.obs;
    return InkWell(
      onTap: () {
        mathController.addText(word);
      },
      onTapDown: (details) {
        isPress.value = true;
      },
      onTapUp: (details) {
        isPress.value = false;
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: backgroundMain,
            borderRadius: BorderRadius.circular(6),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: EdgeInsets.all(isPress.value ? 15 : 10.0),
            decoration: BoxDecoration(
              color: backgroundSecond,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                word,
                style: TextStyle(
                    color: colorText,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BalanceDisplay extends StatelessWidget {
  final String balance;
  final String title;
  final mathController = Get.find<MathController>();

  BalanceDisplay({
    super.key,
    required this.balance,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: Get.size.height * 0.18,
      decoration: BoxDecoration(
        // color: const Color(0xFFBECAB8), // پس‌زمینه سبز روشن
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFADBD9E),
            Color(0xFFB6C5A8),
            Color(0xFFC1D0B5),
            Color(0xFFB6C5A8),
            Color(0xFFADBD9E),
          ],
          stops: [0.0, 0.1, 0.5, 0.8, 1.0],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: CustomPaint(
        painter: LinePainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Text(
                mathController.historyText.value,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Digital'),
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                mathController.displayText.value,
                style: const TextStyle(
                    height: 1,
                    letterSpacing: -1,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Digital'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.3) // رنگ خطوط
      ..strokeWidth = 1.0;

    const double lineSpacing = 18.0; // فاصله بین خطوط
    final double lineCount = size.width / (lineSpacing + 1);

    // رسم خطوط عمودی
    for (double i = 0; i < lineCount; i++) {
      // رسم خط عمودی
      canvas.drawLine(
        Offset(i * (lineSpacing + 1), 0),
        Offset(i * (lineSpacing + 1), size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
