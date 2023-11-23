import 'dart:math';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widget/chart.dart';
import 'package:expenseapp/widget/expense_item.dart';
import 'package:flutter/material.dart';



class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, {Key? key}) : super(key: key);
  final List<Expense> expenses;
  final void Function (Expense expense) onRemove;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
    List<Expense> _removedExpenses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          child: Chart(allExpenses: widget.expenses),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                key: ValueKey(widget.expenses[index]),
                child: ExpenseItem(widget.expenses[index]),
                onDismissed: (direction){
                  if(direction == DismissDirection.endToStart){
                      setState(() {
                        _removedExpenses.add(widget.expenses[index]);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Harcama bilgisi silindi'),
                          action: SnackBarAction(
                            label: 'Geri Al',
                            onPressed: () {
                              _undoRemove();
                            },
                          ),
                        ),
                      );
                  }
                widget.onRemove(widget.expenses[index]);
                },
                );
              }),
        ),
      ]),
    );
  }
    void _undoRemove() {
    if (_removedExpenses.isNotEmpty) {
      Expense lastRemovedExpense = _removedExpenses.removeLast();

      setState(() {
        widget.expenses.add(lastRemovedExpense);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veri geri alındı'),
        ),
      );
    }
  }
}



