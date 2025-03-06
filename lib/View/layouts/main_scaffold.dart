import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  final bool activeAppBar;
  final String title;
  final bool backButton;
  final EdgeInsets padding;
  const MainScaffold(
      {super.key,
      required this.child,
      this.activeAppBar = false,
      this.title = '',
      this.backButton = false,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0)});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: activeAppBar
                ? AppBar(
                    backgroundColor: const Color(0xFFe29647),
                    title: Text(title),
                    centerTitle: true,
                    toolbarHeight: 56,
                  )
                : null,
            body: Padding(
              padding: padding,
              child: child,
            )));
  }
}
