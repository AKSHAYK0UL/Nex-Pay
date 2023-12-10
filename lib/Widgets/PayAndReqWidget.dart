import 'package:flutter/material.dart';

import '../Screens/AddAmountScreen.dart';

class PayAndReqWidget extends StatelessWidget {
  final contactName;
  final contactNumber;
  const PayAndReqWidget({super.key, required this.contactName, required this.contactNumber});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddAmountScreen.routeName,
                  arguments: {'Name': contactName, 'Number': contactNumber});
            },
            child: const SizedBox(
              width: 80,
              child: Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: const SizedBox(
              width: 80,
              child: Text(
                'Request',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
