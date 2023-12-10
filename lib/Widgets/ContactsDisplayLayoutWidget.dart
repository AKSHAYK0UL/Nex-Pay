import 'package:flutter/material.dart';

import '../Screens/AmountOfPayToContacts.dart';

class ContactsDisplayLayoutWidget extends StatelessWidget {
  final String contactName;
  final contactNumber;
  ContactsDisplayLayoutWidget({
    required this.contactName,
    required this.contactNumber,
  });
  // String contactNumber = '123';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AmountOfPayToContacts.routeName,
            arguments: {
              'Name': contactName,
              'Number': contactNumber.first.number
            });
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Text(
                contactName[0],
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            title: Text(
              contactName.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 19.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 0.9,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
