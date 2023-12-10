import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntoductionWidget extends StatelessWidget {
  final imageAddress;
  IntoductionWidget(this.imageAddress);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Lottie.asset(imageAddress),
    );
  }
}
