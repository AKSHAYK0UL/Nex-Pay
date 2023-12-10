import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransactionFailedScreen extends StatefulWidget {
  static const routeName = 'TransactionFailedScreen';
  const TransactionFailedScreen({super.key});

  @override
  State<TransactionFailedScreen> createState() =>
      _TransactionFailedScreenState();
}

class _TransactionFailedScreenState extends State<TransactionFailedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 50,
            child: LottieBuilder.asset(
              'assets/failed.json',
              repeat: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Transaction Failed",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
