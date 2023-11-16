import 'package:flutter/material.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
const ExpenseItem(this.expense, { Key? key }) : super(key: key);
final Expense expense;

  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [Text(expense.name),
        Row(
          children: [
            Text("TL ${expense.price.toStringAsFixed(2)}"), 
            const Spacer(),
            Icon(categoryIcons[expense.category]),
            const SizedBox (width:6),
            Text (DateFormat.yMd().format(expense.date)),
          ],
        )] ),
      )
      );
  }
}