import 'package:expense_tracker/widegts/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widegts/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key}); //forwarded named key to the parent class
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Cinema',
        amount: 59.39,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _openAddExpenseOverlay() {
    // this context property is made available by flutter or State class
    // so context is widget meta information, information on relation to other widgets, information on relation to other widgets
    // so context is meta information, information on relation to other widgets, information on relation to other widgets
    //so context is meta information, information on relation to other widgets, information on relation to other widgets in the widget tree position
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}

// Stateful widgets are indeed widgets that are created using two class first class is widget class itself and the second class is state class
