import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payment_app/Screens/TransactionFailedScreen.dart';
import 'package:provider/provider.dart';

import '../Models/NetworkModel.dart';
import 'TransactionDoneScreen.dart';

class ProcessingScreenWidget extends StatefulWidget {
  const ProcessingScreenWidget({super.key});
  static const routeName = 'ProcessingScreen';

  @override
  State<ProcessingScreenWidget> createState() => _ProcessingScreenWidgetState();
}

class _ProcessingScreenWidgetState extends State<ProcessingScreenWidget> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(
  //     const Duration(milliseconds: 9200),
  //     () {
  //       // Navigator.of(context).pop();
  //       Navigator.of(context)
  //           .pushReplacementNamed(TransactionDoneScreen.routeName);
  //     },
  //   );
  // }
  bool istrue = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (istrue) {
      final isDone = Provider.of<NetworkModel>(context);
      Timer(
        const Duration(milliseconds: 9200),
        () {
          // Navigator.of(context).pop();
          isDone.isinternet
              ? Navigator.of(context)
                  .pushReplacementNamed(TransactionDoneScreen.routeName)
              : Navigator.of(context)
                  .pushReplacementNamed(TransactionFailedScreen.routeName);
        },
      );
    }
    istrue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const CircularProgressIndicator(
          //   color: Colors.black,
          // ),
          Lottie.asset('assets/processing.json', repeat: true),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Processing Please wait...",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
