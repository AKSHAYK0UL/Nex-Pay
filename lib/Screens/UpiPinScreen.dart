import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../Models/NetworkModel.dart';
import '../Models/PayOrRequestModel.dart';
import '../Models/UpiPinModel.dart';
import 'NoInternetScreen.dart';
import 'ProcessingScreen.dart';

// ignore: must_be_immutable
class UpiPinScreen extends StatelessWidget {
  static const routeName = 'UpiPinScreen';
  final PassswordController = TextEditingController();

  void onsubmitPin(BuildContext context, PayAmountModel payamountOBJECT,
      String name, String amount) {
    Timer(Duration(milliseconds: 9300), () {
      payamountOBJECT.PayToContactAddAmount(amount, name);
    });
    // payamountOBJECT.PayToContactAddAmount(amount, name);
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(
      ProcessingScreenWidget.routeName,
    );
  }

  bool? checkPin;
  @override
  Widget build(BuildContext context) {
    final upipin = Provider.of<UpiPin>(context);
    final payAmount = Provider.of<PayAmountModel>(context);
    final isDone = Provider.of<NetworkModel>(context);

    final amountName = ModalRoute.of(context)!.settings.arguments as Map;
    final amount = amountName['amount'];
    final name = amountName['Name'];
    return isDone.isinternet == false
        ? NointernetScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Enter Your UPI Pin",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              elevation: 0,
              backgroundColor: Theme.of(context).canvasColor,
            ),
            body: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * 1,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: TextField(
                    obscureText: upipin.show,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          upipin.show ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: upipin.showPassword,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Enter Your UPI Pin',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    controller: PassswordController,
                    onSubmitted: (value) {
                      checkPin = upipin.CheckPassword(PassswordController.text);
                      checkPin != null && checkPin == true
                          ? onsubmitPin(context, payAmount, name, amount)
                          : const Text("Empty");
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                if (checkPin != null && checkPin == true)
                  const Text(
                    "Correct UPI Pin",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (checkPin != null && checkPin == false)
                  const Text(
                    "Please Enter the correct UPI Pin",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Container(
                  // color: Colors.red,
                  margin: const EdgeInsets.only(
                      left: 20, right: 1, top: 5, bottom: 5),
                  child: LottieBuilder.asset(
                    'assets/upipin.json',
                    height:
                        WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                            ? MediaQuery.of(context).size.height * 0.460
                            : MediaQuery.of(context).size.height * 0.800,
                    width: double.infinity,
                  ),
                )
              ],
            ),
          );
  }
}
