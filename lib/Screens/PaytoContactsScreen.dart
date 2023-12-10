import 'package:flutter/material.dart';
import 'package:payment_app/Widgets/ContactsDisplayWidget.dart';
import 'package:payment_app/Widgets/SearchWidget_Custom.dart';
import 'package:provider/provider.dart';

import '../Models/ContactsModel.dart';
import '../Models/NetworkModel.dart';
import 'NoInternetScreen.dart';

class PaytoContactsScreen extends StatelessWidget {
  const PaytoContactsScreen({super.key});
  static const routeName = 'PaytoContactsScreen';

  @override
  Widget build(BuildContext context) {
    final ContactData = Provider.of<ContactsModel>(context, listen: true);
    final isDone = Provider.of<NetworkModel>(context);

    return isDone.isinternet == false
        ? NointernetScreen()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).canvasColor,
              elevation: 0,
              title: Text(
                "Pay to contacts",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: Column(
              children: [
                SearchWidget_Custom(
                  icon: Icons.contact_page,
                  hinttext: 'Pay to contacts',
                  Onclick: ContactData.runFilter,
                  keyboardInputFormat: 'Letters',
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "All people on UPI",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const ContactsDisplayWidget(),
              ],
            ),
          );
  }
}
