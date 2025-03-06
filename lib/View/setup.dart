import 'package:flutter/material.dart';
import 'package:hidden_app/View/layouts/main_scaffold.dart';

class Setup extends StatelessWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'تنظیم رمز عبور اولیه',
              ),
            ),
            Text(
                'برای محافظت از اطلاعات شما، لطفاً یک رمز عبور تعیین کنید. این رمز برای ورود به بخش مخفی اپلیکیشن استفاده خواهد شد')
          ],
        ),
      ),
    );
  }
}
