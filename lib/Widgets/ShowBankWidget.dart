import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../Models/PayOrRequestModel.dart';
import '../Screens/UpiPinScreen.dart';

class ShowBankWidget extends StatefulWidget {
  final contactName;
  final amount;
  ShowBankWidget({required this.contactName, required this.amount});

  @override
  State<ShowBankWidget> createState() => _ShowBankWidgetState();
}

class _ShowBankWidgetState extends State<ShowBankWidget> {
  int _selectedValue = 0;

  Widget bankBuild(BuildContext context, String bankName, int num) {
    return Column(
      children: [
        RadioListTile<int>(
          title: Text(
            bankName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          secondary: const Icon(
            Icons.account_balance,
            size: 30,
          ),
          activeColor: Colors.blue,
          value: num,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(
              () {
                _selectedValue = num;
              },
            );
          },
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
          indent: 15,
          endIndent: 15,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final payAmount = Provider.of<PayAmountModel>(context);
    return Column(
      children: [
        bankBuild(context, 'Jammu and kashmir bank', 0),
        bankBuild(context, 'ICICI bank', 1),
        bankBuild(context, 'HDFC bank', 2),
        Container(
          width: MediaQuery.of(context).size.width * 0.70,
          height: MediaQuery.of(context).size.height * 0.06,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue,
          ),
          child: TextButton.icon(
            onPressed: () {
              // Navigator.of(context).pop();
              // payAmount.PayToContactAddAmount(
              //     widget.amount, widget.contactName);
              // Navigator.of(context).pushReplacementNamed(
              //   ProcessingScreenWidget.routeName,
              // );
              Navigator.of(context).pushNamed(
                UpiPinScreen.routeName,
                arguments: {
                  'Name': widget.contactName,
                  'amount': widget.amount,
                },
              );
            },
            icon: const Icon(
              Icons.send_sharp,
              color: Colors.white,
              size: 28,
            ),
            label: const Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
