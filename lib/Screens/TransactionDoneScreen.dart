import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TransactionDoneScreen extends StatefulWidget {
  static const routeName = 'TransactionDoneScreen';
  const TransactionDoneScreen({super.key});

  @override
  State<TransactionDoneScreen> createState() => _TransactionDoneScreenState();
}

class _TransactionDoneScreenState extends State<TransactionDoneScreen> {
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
              'assets/transactionDone.json',
              repeat: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Transaction Done Successfully",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
