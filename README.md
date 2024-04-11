# eai_flutter_assignment

#Task
Your task is to build the frontend of an MVP version of this trading app on Flutter which should include the following feature.

###Watchlist screen:
This is one of the core components on any trading platform.
We'll give you a json with 30 stocks with their tokens as keys and values containing a bunch of other fields which would be completely suffient for this assignment and you would not require any additional data.
Display these stocks on the watchlist. It should contain the symbol and the LTP (Last traded price), the process of getting LTP is given below.
Join the given websocket to display the LTP of the stock on the watchlist. The websocket would be active most of the times, in case there's a downtime, it would be back up in 2 hours. The websocket has a rate limit of 1 message per second, just to be safe take it to be 1.5 sec per message.
Display the data received from the websocket on the watchlist corresponding to every stock.
Implement a delete from watchlist functionality upon left swipe of the specific stock.
You're supposed to manage the unsubscriptions from websocket as well.
