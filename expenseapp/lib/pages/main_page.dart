
import 'package:expenseapp/pages/expenses_pages.dart';
import 'package:expenseapp/widget/new_expense.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                      return const NewExpense();
                    });
              },
              icon: const Icon(Icons.add),
              tooltip: 'Yeni giriş',
              iconSize: 32,)
        ],
      ),
      body: const ExpensesPage(),
    );
  }
}




