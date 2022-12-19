import 'package:flutter/material.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Admin',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('GROCERY APP'),
        ),
      ),
    );
  }
}
