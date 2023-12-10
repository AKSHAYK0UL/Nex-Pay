import 'package:flutter/material.dart';
import 'package:payment_app/Widgets/BannerWidget.dart';
// import 'package:payment_app/Screens/BottomNavBarWidget.dart';
import 'package:payment_app/Widgets/OptionWidget.dart';
import 'package:payment_app/Widgets/SearchWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SearchWidget(),
        BannerWidget(),
        const optionWidget(),
      ],
    );
  }
}
