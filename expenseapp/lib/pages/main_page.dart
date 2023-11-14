
import 'package:expenseapp/pages/expenses_pages.dart';
import 'package:expenseapp/widget/new_expensive.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense();
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



