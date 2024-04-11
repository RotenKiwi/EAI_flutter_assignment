import 'package:flutter/material.dart';
import 'Screens/watchlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Watchlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockWatchlistPage(),
    );
  }
}
