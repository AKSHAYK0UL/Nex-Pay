import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:payment_app/Models/PayOrRequestModel.dart';
import 'package:provider/provider.dart';
import 'PaytoContactsTransactionScreen.dart';

class AllTransactionScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionDetail = Provider.of<PayAmountModel>(context);
    var reveredLength = transactionDetail.getTransaction.reversed.toList();

    return transactionDetail.getTransaction.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LottieBuilder.asset('assets/nohistory.json'),
              ),
              Center(
                child: Text(
                  'No Transaction Yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Transaction",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        reveredLength.length > 10 ? 10 : reveredLength.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                PaytoContactsTransactionScreen.routeName,
                                arguments: {
                                  'Name': reveredLength[index].userName,
                                  'Amount': reveredLength[index].amount,
                                  'Date': reveredLength[index].date,
                                  'Status': reveredLength[index].status
                                },
                              );
                            },
                            splashColor: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade500)),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              width: MediaQuery.of(context).size.width * 0.24,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 33,
                                    backgroundColor: Colors.grey.shade300,
                                    child: Text(
                                      reveredLength[index].userName[0],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    reveredLength[index].userName,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "All Transaction",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: reveredLength.length,
                    itemBuilder: (context, index) {
                      final transinfo = reveredLength[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            PaytoContactsTransactionScreen.routeName,
                            arguments: {
                              'Name': reveredLength[index].userName,
                              'Amount': reveredLength[index].amount,
                              'Date': reveredLength[index].date,
                              'Status': reveredLength[index].status
                            },
                          );
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 30,
                          child: Text(
                            transinfo.userName[0],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        title: Text(
                          transinfo.userName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          DateFormat('MMM dd yyyy hh:mm a')
                              .format(transinfo.date),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: Text(
                            '₹${transinfo.amount}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
  }
}
