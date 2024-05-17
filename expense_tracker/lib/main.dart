import 'package:expense_tracker/widegts/expenses.dart';
import 'package:flutter/material.dart';

// golobal variable convention or theme realted variable start with k it's just convention

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          // useMaterial3: true,

          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
              color: kDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.all(
                  16) //base margin for all the card used in app
              // marign:const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer,
                foregroundColor: kDarkColorScheme.onPrimaryContainer),
          )),
      theme: ThemeData().copyWith(
          // useMaterial3: true,
          // scaffoldBackgroundColor: const Color.fromARGB(255, 22, 19, 71),
          colorScheme: kColorScheme,
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 14)),
          cardTheme: const CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.all(
                  16) //base margin for all the card used in app
              // marign:const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer)),
      title: 'Expenses',
      themeMode: ThemeMode.system, // default is systtem
      home: const Expenses(),
    ),
  );
}

// we have a quite detail look at theeming, how to switch between light and dark theme some user prefer might dark mode so you might want alternative dark them
