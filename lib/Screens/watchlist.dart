import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import '../UIComponents/dialogBox.dart';
import '../UIComponents/dismissibleBackground.dart';
import '../UIComponents/stockCard.dart';
import '../UIComponents/stockDetailsDialog.dart';
import '../constants.dart';

class StockWatchlistPage extends StatefulWidget {
  @override
  _StockWatchlistPageState createState() => _StockWatchlistPageState();
}

class _StockWatchlistPageState extends State<StockWatchlistPage> {
  late IOWebSocketChannel channel;
  StreamSubscription? streamSubscription;
  bool isProcessingMessage = false;
  final stockData = jsonDecode(jsonData) as Map<String, dynamic>;

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect(
        'ws://122.179.143.201:8089/websocket?sessionID=PARTH&userID=PARTH&apiToken=PARTH');

    subscribeToLTP();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    channel.sink.close();
    super.dispose();
  }

  void subscribeToLTP() {
    final subscribeData = jsonEncode({
      "Task": "subscribe",
      "Mode": "ltp",
      "Tokens": watchlistTokens,
    });
    channel.sink.add(subscribeData);

    streamSubscription = channel.stream.listen((message) {
      if (!isProcessingMessage) {
        isProcessingMessage = true;
        Timer(Duration(milliseconds: 1500), () {
          final data = jsonDecode(message);
          handleLTPData(data);
          isProcessingMessage = false;
        });
      }
    });
  }

  List<List<int>>? LTPvalues;

  void handleLTPData(Map<String, dynamic> data) {
    List<List<int>> tempList = [];
    for (var token in watchlistTokens) {
      if (data.containsKey(token.toString())) {
        final ltp = data[token.toString()];
        setState(() {
          tempList.add([token, ltp]);
          LTPvalues = tempList;
        });
      }
    }
  }

  void _unsubscribeFromLTP(int token) {
    if (watchlistTokens.contains(token)) {
      channel.sink.add(jsonEncode({
        'Task': 'unsubscribe',
        'Mode': 'ltp',
        'Tokens': [token],
      }));
      watchlistTokens.remove(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Watchlist'),
      ),
      body: (LTPvalues != null)
          ? ListView.builder(
              itemCount: watchlistTokens.length,
              itemBuilder: (context, index) {
                final token = watchlistTokens[index];
                if (LTPvalues!.length < watchlistTokens.length) {
                  return Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ));
                } else {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return stockCard(
                              stockData: stockData,
                              token: token,
                              LTPvalues: LTPvalues,
                              index: index,
                            );
                          });
                    },
                    child: Dismissible(
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return confirmDismissDialog();
                          },
                        );
                      },
                      onDismissed: (direction) {
                        _unsubscribeFromLTP(token);
                        setState(
                          () {
                            watchlistTokens.remove(token);
                            LTPvalues!.removeAt(watchlistTokens.indexOf(token));
                          },
                        );
                      },
                      key: Key(token.toString()),
                      background: dismissibleBackground(),
                      child: StockCard(
                        stockData: stockData,
                        token: token,
                        LTPvalues: LTPvalues,
                        index: index,
                      ),
                    ),
                  );
                }
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
