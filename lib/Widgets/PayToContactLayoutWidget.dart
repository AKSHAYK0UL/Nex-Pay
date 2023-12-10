import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Screens/PaytoContactsTransactionScreen.dart';

class PayToContactLayoutWidget extends StatelessWidget {
  final contactName;
  final amount;
  final status;
  final date;
  const PayToContactLayoutWidget({
    super.key,
    required this.contactName,
    required this.amount,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          PaytoContactsTransactionScreen.routeName,
          arguments: {
            'Name': contactName,
            'Amount': amount,
            'Status': status,
            'Date': date
          },
        );
      },
      splashColor: Colors.grey.shade500,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.24,
        // width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
        ),
        child: Card(
          elevation: 0,
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Paid to $contactName',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .050,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  '₹$amount',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(
                      Icons.check,
                      color: Colors.green.shade600,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$status',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Text(
                'Paid on ${DateFormat('MMMd').format(date)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
