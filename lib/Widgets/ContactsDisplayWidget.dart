//import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
//import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Models/ContactsModel.dart';
import 'ContactsDisplayLayoutWidget.dart';

class ContactsDisplayWidget extends StatefulWidget {
  const ContactsDisplayWidget({super.key});

  @override
  State<ContactsDisplayWidget> createState() => _ContactsDisplayWidgetState();
}

class _ContactsDisplayWidgetState extends State<ContactsDisplayWidget> {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    final ContactData = Provider.of<ContactsModel>(context);
    setState(() {
      if (isTrue) {
        ContactData.foundUsers = ContactData.contacts;
        ContactData.getContacts();
      }
      isTrue = false;
    });

    return ContactData.contacts.isEmpty
        ? Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.200),
            // padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const CircularProgressIndicator(color: Colors.black),

                Lottie.asset(
                  'assets/loadingcontacts.json',
                  height: 120,
                ),

                Text(
                  "Loading Contacts...",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          )
        : Expanded(
            child: ContactData.foundUsers.isEmpty
                ? const Center(
                    child: Text(
                      'No contact Found!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ContactData.foundUsers.length,
                    itemBuilder: (context, index) {
                      Contact contact = ContactData.foundUsers[index];

                      return contact.displayName.isNotEmpty
                          ? ContactsDisplayLayoutWidget(
                              contactName: contact.displayName,
                              contactNumber: contact.phones,
                            )
                          : null;
                      // return contact.displayName.isNotEmpty
                      //     ? Text(contact.displayName)
                      //     : null;
                    },
                  ),
          );
  }
}
