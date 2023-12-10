import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payment_app/Widgets/PayAndReqWidget.dart';
import 'package:provider/provider.dart';
import '../Models/NetworkModel.dart';
import '../Models/PayOrRequestModel.dart';
import '../Widgets/PayToContactLayoutWidget.dart';
import 'NoInternetScreen.dart';

class AmountOfPayToContacts extends StatelessWidget {
  static const routeName = 'AmountOfPayToContacts';

  const AmountOfPayToContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final payAmount = Provider.of<PayAmountModel>(context);
    final isDone = Provider.of<NetworkModel>(context);

    final contact = ModalRoute.of(context)!.settings.arguments as Map;
    final contactName = contact['Name'];
    final ContactNumber = contact['Number'];
    final tx = payAmount.getTransaction
        .where((tx) => tx.userName.contains(contactName))
        .toList();
    final reversedTx = tx.reversed.toList();
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
                  contactName,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  ContactNumber,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            body: tx.isEmpty
                ? Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        margin: const EdgeInsets.only(
                            top: 100, bottom: 20, right: 1, left: 1),
                        // height: 1000,
                        // child: Image.asset(
                        //   'noactimg/notrans.png',
                        //   width: double.infinity,
                        //   height: double.infinity,
                        //   fit: BoxFit.cover,
                        // ),
                        child: Lottie.asset('assets/notransaction.json',
                            repeat: false),
                      ),
                      Text(
                        'No Transaction Yet!',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * .9,
                        child: ListView.builder(
                          reverse: true,
                          itemCount: reversedTx.length,
                          itemBuilder: (context, index) {
                            return PayToContactLayoutWidget(
                              contactName: contactName,
                              amount: reversedTx[index].amount,
                              date: reversedTx[index].date,
                              status: reversedTx[index].status,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
            bottomNavigationBar: Row(
              children: [
                PayAndReqWidget(
                    contactName: contactName, contactNumber: ContactNumber),
              ],
            ),
          );
  }
}
