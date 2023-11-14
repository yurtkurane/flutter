import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)), // 1 yıl önce
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: InputDecoration(labelText: "Harcama Adı"),
          ),

          TextField(
            controller: _expensePriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Harcama Miktarı"),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(border:Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: [
                    IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.calendar_month),
                    ),
                    Text("Tarih Seçiniz: ${_selectedDate != null ? _selectedDate!.toLocal().toString().split(' ')[0] : 'Seçilmedi'}"),
                  ],
                ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                print(
                    "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceController.text}");
              },
              child: Text("Ekle"))
        ]),
      ),
    );
  }
}