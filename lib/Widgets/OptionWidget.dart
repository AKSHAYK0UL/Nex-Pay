import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_app/Screens/PaytoContactsScreen.dart';

import '../Screens/MobileRechargeScreen.dart';

class optionWidget extends StatelessWidget {
  const optionWidget({super.key});

  Widget BuildOptionButton(
      String text, IconData icon, Function() onclick, BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.108,
      width: MediaQuery.of(context).size.width * 0.242,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: InkWell(
          borderRadius: BorderRadius.circular(9),
          splashColor: Colors.grey.shade400,
          onTap: onclick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Column(
              children: [
                Icon(icon),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.31,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildOptionButton(
                'Pay\ncontacts',
                Icons.contact_page,
                () => Navigator.of(context)
                    .pushNamed(PaytoContactsScreen.routeName),
                context,
              ),
              BuildOptionButton(
                'Pay\nphone no',
                Icons.phone,
                () {},
                context,
              ),
              BuildOptionButton(
                'Pay\nbills',
                Icons.payment,
                () {},
                context,
              ),
              BuildOptionButton(
                'Mobile\nrecharge',
                Icons.mobile_friendly,
                () => Navigator.of(context)
                    .pushNamed(MobileRechargeScreen.routeName),
                context,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildOptionButton(
                'Bank\ntransfer',
                Icons.account_balance,
                () {},
                context,
              ),
              BuildOptionButton(
                'Pay\nto upi',
                Icons.api,
                () {},
                context,
              ),
              BuildOptionButton(
                'Self\ntransfer',
                Icons.autorenew,
                () {},
                context,
              ),
              BuildOptionButton(
                'More\noptions',
                Icons.more_vert,
                () {},
                context,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "  Upi ID  : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Text(
                  "Abcd@Okicici",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(text: "Abcd@Okicici"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 50),
                          content: Text(
                            "Copied to clipboard",
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.grey.shade100,
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                        ),
                      );
                    },
                    icon: const Icon(Icons.content_copy))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
