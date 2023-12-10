//import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
//import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsModel with ChangeNotifier {
  List<Contact> contacts = [];

  void getContacts() async {
    bool isGranted = await Permission.contacts.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      List<Contact> _contacts = await FlutterContacts.getContacts(
        withProperties: true,
        sorted: true,
        deduplicateProperties: true,
      );
      contacts = _contacts;
      // List<Contact> _contacts =
      // await FastContacts.getAllContacts().then((listOFcontact) {
      //   contacts = listOFcontact;
      // });

      // List<Contact> _contacts = await ContactsService.getContacts();
      // contacts = _contacts;
    }
    runFilter('');

    notifyListeners();
  }

  //Search contact
  List<Contact> foundUsers = [];

  void runFilter(String searchKeyword) {
    // foundUsers = contacts;
    List<Contact> searchReasult = [];
    if (searchKeyword.isEmpty) {
      searchReasult = contacts;
    } else {
      searchReasult = contacts
          .where(
            (user) => user.displayName!.toLowerCase().contains(
                  searchKeyword.toLowerCase(),
                ),
          )
          .toList();
    }
    foundUsers = searchReasult;
    notifyListeners();
  }
}
