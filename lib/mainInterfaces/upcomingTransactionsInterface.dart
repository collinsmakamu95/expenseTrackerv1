import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../lists.dart';

class TransactionInterface extends StatefulWidget {
  const TransactionInterface({Key? key}) : super(key: key);

  @override
  State<TransactionInterface> createState() => _TransactionInterfaceState();
}

class _TransactionInterfaceState extends State<TransactionInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upcoming Transactions",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
          ),
        ),
        ),
      body: (Container(child: const PastTransactionsList())),
      );

  }
}

class PastTransactionsList extends StatefulWidget {
  const PastTransactionsList({Key? key}) : super(key: key);

  @override
  State<PastTransactionsList> createState() => _PastTransactionsListListState();
}

class _PastTransactionsListListState extends State<PastTransactionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: upcomingTransactions.length - 1,
        itemBuilder: (context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.greenAccent, width: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: upcomingTransactions[index][0],
              title: Text(
                upcomingTransactions[index][1],
                style: const TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(upcomingTransactions[index][3]),
              trailing: Text(DateFormat.MMMMEEEEd()
                  .format(upcomingTransactions[index][2])
                  .toString()),
            ),
          );
        });
  }
}

