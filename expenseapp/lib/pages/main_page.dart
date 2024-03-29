
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expenses_pages.dart';
import 'package:expenseapp/widget/new_expense.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

    List<Expense> expenses = [
    Expense(name: "Yemek", price: 500.529, date: DateTime.now(), category: Category.food),
    Expense(name: "Udemy Kursu", price: 200, date: DateTime.now(), category: Category.work),
  ];

  addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Expense App"),
        backgroundColor: Color.fromARGB(255, 59, 18, 222),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(addExpense);
                    });
              },
              icon: const Icon(Icons.add),
              tooltip: 'Yeni giriş',
              iconSize: 32,)
        ],
      ),
      body: expenses.length > 0 
           ? ExpensesPage(expenses, removeExpense)
           : Text ("Harcama gideri eklemek için sağ üstteki + işaretine tıklayınız."),
    );
  }
}




