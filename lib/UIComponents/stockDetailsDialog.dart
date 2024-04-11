import 'package:flutter/material.dart';


class stockCard extends StatelessWidget {
  const stockCard({
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
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
                "Symbol:  ${stockData[token.toString()]["symbol"]}"),
            SizedBox(
              height: 10,
            ),
            Text(
                "Company Name: ${stockData[token.toString()]["company"]}"),
            SizedBox(
              height: 10,
            ),
            Text(
                "Industry: ${stockData[token.toString()]["industry"]}"),
            SizedBox(
              height: 10,
            ),
            Text(
                "Sectoral Index: ${stockData[token.toString()]["sectoralIndex"]}"),
            SizedBox(
              height: 10,
            ),
            Text(
                "Last Traded Price: ${LTPvalues![index][1].toString()}"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}