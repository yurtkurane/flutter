import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesPages extends StatefulWidget {
  const ExpensesPages({ Key? key }) : super(key: key);

  @override
  _ExpensesPagesState createState() => _ExpensesPagesState();
}

class _ExpensesPagesState extends State<ExpensesPages> {

  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy Kursu", price: 500, date: DateTime.now()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Grafik Bölümü"),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context,index){
                return Text(expenses[index].name);
            }),
          )]
           ),
      ),  
    );
  }
}

