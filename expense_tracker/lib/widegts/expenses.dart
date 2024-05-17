import 'package:expense_tracker/widegts/chart/chart.dart';
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
      isScrollControlled: true, // to show full modal
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    //object for showing or hiding certin ui
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
        content: const Text(
          'Expense deleted.',
        )));
    // snackbar is just a info shown on the screen
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
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
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}

// Stateful widgets are indeed widgets that are created using two class first class is widget class itself and the second class is state class
// Getting start with theming
// this app doesn't look super ugly not really that appealing visually

