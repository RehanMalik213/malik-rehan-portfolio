import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/base_page.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(children: [AppText(text: "Portfolio")]),
    );
  }
}
