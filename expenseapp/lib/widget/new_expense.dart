import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';


class NewExpense extends StatefulWidget {
  const NewExpense(this.onAdd, {Key? key}) : super(key: key);
  final void Function(Expense expense) onAdd;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)), // 1 yıl önce
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        const isDateSelected = true;
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expensePriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Harcama Miktarı", prefixText: "₺"),
                ),
              ),

              IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_month),),
              Text("Tarih Seçiniz: ${_selectedDate != null ? _selectedDate?.toLocal().toString().split(' ')[0] : 'Seçilmedi'}"),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) {
                return DropdownMenuItem (
                  value: category, child: Text(category.name));
              }).toList(),
               onChanged: (value) {
                setState((){
                  if (value != null) _selectedCategory = value;
                });
              })
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat")),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    double? price =
                        double.tryParse(_expensePriceController.text);

                    // validation

                    Expense expense = Expense(
                        name: _expenseNameController.text,
                        price: price!,
                        date: _selectedDate!,
                        category: _selectedCategory);
                    widget.onAdd(expense);
                    Navigator.pop(context);
                  },
                  child: Text("Ekle")),
            ],
          ),
        ]),
      ),
    );
  }
}