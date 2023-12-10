import 'package:flutter/material.dart';

class PayingPersonInfoWidget extends StatelessWidget {
  final contactName;
  final contactNumber;
  const PayingPersonInfoWidget(
      {super.key, required this.contactName, required this.contactNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Account Info',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Text(
            "Account Name : $contactName",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Phone number : $contactNumber",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Bank name : Jammu And Kashmir Bank",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
