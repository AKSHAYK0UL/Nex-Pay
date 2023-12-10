import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaytoContactsTransactionScreen extends StatelessWidget {
  static const routeName = 'PaytoContactsTransactionScreen';
  const PaytoContactsTransactionScreen({super.key});
  Widget infoBuild(String text1, String text2, BuildContext context) {
    return ListTile(
      title: Text(
        text1,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        text2,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TransactionDetail = ModalRoute.of(context)!.settings.arguments as Map;
    final Name = TransactionDetail['Name'];
    final Amount = TransactionDetail['Amount'];
    final Date = TransactionDetail['Date'];
    final Status = TransactionDetail['Status'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Transaction Detail',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              minVerticalPadding: 25,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 30,
                  child: Text(
                    Name[0],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              subtitle: Column(
                children: [
                  Text(
                    'Paid to $Name',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '₹$Amount',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 55,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 16,
                        child: Icon(
                          Icons.check,
                          color: Colors.green.shade600,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        Status,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 0.7,
                    indent: 35,
                    endIndent: 35,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat('MMM dd yyyy hh:mm a').format(Date),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.46,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 1, color: Colors.black54),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "Jammu & Kashmir Bank 1235",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black54,
                      ),
                      infoBuild('UPI transaction ID', '02148563017', context),
                      infoBuild(
                          'TO: ${Name.replaceAll(' ', '')}',
                          '${Name.replaceAll(' ', '').toString().toLowerCase()}58741@Okicici',
                          context),
                      infoBuild('From: Akshay Koul (Jammu & Kashmir Bank)',
                          'akshaykoul25122001@okaxis', context),
                      infoBuild(
                          'Nex Pay transaction ID', 'AVGdkHSgNKSNG', context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
