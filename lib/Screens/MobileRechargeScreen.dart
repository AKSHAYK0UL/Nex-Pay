import 'package:flutter/material.dart';
import 'package:payment_app/Widgets/SearchWidget_Custom.dart';
import 'package:payment_app/Widgets/SimOperatorsWidget.dart';

class MobileRechargeScreen extends StatelessWidget {
  static const routeName = 'MobileRechargeScreen';
  const MobileRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: Text(
            "Mobile recharge",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Column(
          children: [
            SearchWidget_Custom(
              icon: Icons.mobile_friendly,
              hinttext: 'Enter mobile number',
              Onclick: () {},
              keyboardInputFormat: 'Letters',
            ),
            const SimOperatorsWidget(),
          ],
        ));
  }
}
