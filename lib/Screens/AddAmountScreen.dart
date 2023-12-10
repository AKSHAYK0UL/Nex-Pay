import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/Widgets/PayingPersonInfoWidget.dart';
import 'package:provider/provider.dart';

import '../Models/NetworkModel.dart';
import '../Widgets/ShowBankWidget.dart';
import 'NoInternetScreen.dart';

class AddAmountScreen extends StatelessWidget {
  final textController = TextEditingController();

  static const routeName = 'AddAmountScreen';

  AddAmountScreen({super.key});
  // void onSubmit() {
  //   if (textController.text.isEmpty || num.parse(textController.text) <= 0) {
  //     return;
  //   }
  // payAmount.PayToContactAddAmount(textController.text);
  // }
  void showbank(BuildContext context, String name, String amount) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: (context),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: ShowBankWidget(
                contactName: name,
                amount: amount,
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final payAmount = Provider.of<PayAmountModel>(context);
    final isDone = Provider.of<NetworkModel>(context);

    final contactInfo = ModalRoute.of(context)!.settings.arguments as Map;
    final contactName = contactInfo['Name'];
    final contactNumber = contactInfo['Number'];

    void onsubmit() {
      if (textController.text.isEmpty || num.parse(textController.text) <= 0) {
        return;
      }
      showbank(context, contactName, textController.text);
      // payAmount.PayToContactAddAmount(textController.text, contactName);
      // Navigator.of(context).pushReplacementNamed(
      //   ProcessingScreenWidget.routeName,
      // );
    }

    return isDone.isinternet == false
        ? NointernetScreen()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).canvasColor,
              title: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    contactName[0],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                title: Text(
                  'Paying to $contactName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  contactNumber,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                PayingPersonInfoWidget(
                    contactName: contactName, contactNumber: contactNumber),
                Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * 1,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.indianRupeeSign,
                        color: Colors.black,
                        size: 25,
                      ),
                      hintText: 'Add Amount',
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
                    controller: textController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              // onPressed: () {
              // payAmount.PayToContactAddAmount(textController.text);
              //   Navigator.of(context).pop();
              // },
              onPressed: () {
                onsubmit();
              },
              backgroundColor: Colors.blue,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          );
  }
}
