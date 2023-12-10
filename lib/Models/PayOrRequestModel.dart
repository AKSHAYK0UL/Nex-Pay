// import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
part 'PayOrRequestModel.g.dart';

@HiveType(typeId: 0)
class PayAmount {
  @HiveField(0)
  final String amount;
  @HiveField(1)
  final String status;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final String userName;
  PayAmount({
    required this.amount,
    required this.status,
    required this.date,
    required this.userName,
    // required this.phNumber,
  });
}

class PayAmountModel with ChangeNotifier {
  List<PayAmount> payTransactionList = [
    // PayAmount(
    //     amount: "2000",
    //     date: DateTime.now(),
    //     status: 'Paid Successfully',
    //     userName: 'Akshay At'
    //     // phNumber: "1234567890"
    //     )
  ];
  final transactionbox = Hive.box('transdone');

  void PayToContactAddAmount(String amount, String name) {
    final url = Uri.parse(
        'https://transactioninfo-5ab45-default-rtdb.asia-southeast1.firebasedatabase.app/Tranactions.json');
    http
        .post(
      url,
      body: json.encode(
        {
          'Name': name,
          'Amount': amount,
          'Status': 'Paid Successfully',
          'Date': DateFormat('MMM dd yyyy hh:mm a').format(DateTime.now()),
        },
      ),
    )
        .then(
      (reponse) {
        final NewTransaction = PayAmount(
          amount: amount,
          status: 'Paid Successfully',
          date: DateTime.now(),
          userName: name,
        );
        // payTransactionList.add(NewTransaction);
        transactionbox.add(NewTransaction);
        notifyListeners();
      },
    );
    // final NewTransaction = PayAmount(
    //   amount: amount,
    //   status: 'Paid Successfully',
    //   date: DateTime.now(),
    //   userName: name,
    // );
    // payTransactionList.add(NewTransaction);
    // transactionbox.add(NewTransaction);
    // notifyListeners();
  }

  List<PayAmount> get getTransaction {
    return [...transactionbox.values];
  }
}
