import 'package:flutter/material.dart';


class StockCard extends StatelessWidget {
  const StockCard({
    super.key,
    required this.stockData,
    required this.token,
    required this.LTPvalues, required this.index,
  });

  final Map<String, dynamic> stockData;
  final int token;
  final int index;
  final List<List<int>>? LTPvalues;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(20.0)),
          color: Colors.greenAccent,
        ),
        child: ListTile(
          title: Text(
            stockData[token.toString()]["symbol"],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Last Traded Price (LTP) : ${LTPvalues![index][1].toString()}",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}