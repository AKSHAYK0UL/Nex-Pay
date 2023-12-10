import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NointernetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/nonet.json'),
        ),
        Text(
          'No Internet Connection.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    ));
  }
}
