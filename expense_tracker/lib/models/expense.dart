import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
// using string is flexible we need to allow fixed set of values so use enum, enum is the group of constant values
// use intl for date related taks
// below fn is the getter method which is treated as the property instead of using method we can use this one as property of object.
  String get formattedDate {
    return formatter.format(date);
  }
}

// In Dart "Initializer Lists" can be used to initialize class properties like id with values that are not received as constructor function arguments.
// An enum is a special "class" that represents a group of constants(unchangable variables)

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  // adding the additional constructor function or alternative constructor fn to the default constructor function  in the class
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
// sum = sum+expense.amount;
      sum += expense.amount;
    }
    return sum;
  }
}
