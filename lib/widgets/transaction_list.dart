import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, Constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "Nothing to see yet except this!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: Constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/autn.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    transaction: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
