import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_app/Controller/setup_controller.dart';
import 'package:hidden_app/View/layouts/main_scaffold.dart';
import 'package:hidden_app/utils/colors.dart';

class Setup extends StatelessWidget {
  Setup({super.key});
  final setupController = Get.put(SetupController());
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      padding: EdgeInsets.zero,
      activeAppBar: true,
      title: 'تنظیم رمز عبور اولیه',
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            mainScreen(),
            const SizedBox(
              height: 60,
            ),
            keyboard(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await setupController.savePassword();
                    Get.offAllNamed('/home');
                  },
                  icon: const Icon(Icons.forward, color: Colors.white),
                  label: const Text(
                    'تایید رمز و ادامه',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget keyboard() {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            rowKeyboard(['1', '2', '3']),
            rowKeyboard(['4', '5', '6']),
            rowKeyboard(['7', '8', '9']),
            rowKeyboard(['', '0', 'remove']),
          ],
        ),
      ),
    );
  }

  Widget rowKeyboard(List numbers) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            for (String number in numbers) buttonRow(number.toString())
          ],
        ),
      ),
    );
  }

  Widget buttonRow(
    String text,
  ) {
    if (text.isEmpty) {
      return Expanded(
        child: Container(),
      );
    }
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.background,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 1,
                  offset: Offset(2, 5),
                  blurRadius: 4,
                  color: Colors.grey)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setupController.addNumber(text);
            },
            onLongPress: () {
              if (text == 'remove') {
                setupController.removeAll();
              }
            },
            child: Center(
                child: text == 'remove'
                    ? const Icon(
                        Icons.backspace,
                        color: Colors.white,
                        size: 35,
                      )
                    : Text(
                        text.toString(),
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'digital',
                            color: Colors.white),
                      )),
          ),
        ),
      ),
    );
  }

  Padding mainScreen() {
    final RxBool hidePassword = true.obs;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'برای محافظت از اطلاعات شما، لطفاً یک رمز عبور تعیین کنید.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'این رمز برای ورود به بخش مخفی اپلیکیشن استفاده خواهد شد.',
            textAlign: TextAlign.center, // وسط‌چین کردن متن
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => TextField(
              textAlign: TextAlign.center,
              controller: setupController.password,
              style: const TextStyle(fontSize: 24),
              readOnly: true,
              obscureText: hidePassword.value,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                      onTap: () {
                        hidePassword.value = !hidePassword.value;
                      },
                      child: Icon(hidePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              liWidget(
                  number: '1', text: 'رمز عبور شما باید حداقل ۴ رقم باشد.'),
              liWidget(
                  number: '2', text: 'می‌توانید از اعداد دلخواه استفاده کنید.'),
              liWidget(
                  number: '3',
                  text:
                      'لطفاً رمز خود را فراموش نکنید، زیرا بدون آن دسترسی به فایل‌های مخفی‌شده امکان‌پذیر نخواهد بود.'),
            ],
          )
        ],
      ),
    );
  }

  Widget liWidget({required String number, required String text}) {
    return Row(
      children: [Text('$number) '), Expanded(child: Text(text))],
    );
  }
}
