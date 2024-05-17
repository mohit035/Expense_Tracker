import 'package:expense_tracker/widegts/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Expenses',
      home: const Expenses(),
    ),
  );
}
