
import 'package:flutter/material.dart';

///You can use this for locking down the user after multiple login attempt to prevent against DOS and BruteForce
Future<Widget> tempLockUser(BuildContext context,

    ///Time in seconds
    {int time = 30,

      ///The widget that you want the timer to navigate to after timer is finished.
      required Widget afterCountNavigateTo,

      ///The message you want to display in the locked user page;
      String lockedPageMessage = "You are temporary locked"}) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) =>
          _countdownPage(time, lockedPageMessage, afterCountNavigateTo),
    ),
  ); // Return a placeholder widget for now
}

Widget _countdownPage(int time, String message, nextPage) {
  return MaterialApp(
    home: WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: StreamBuilder<int>(
            stream: _countdownStream(time),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == -1) {
                  return nextPage;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    Text(snapshot.data.toString()),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    ),
  );
}

Stream<int> _countdownStream(int time) async* {
  var counter = time;
  while (counter > 0) {
    await Future.delayed(const Duration(seconds: 1));
    yield counter;
    counter--;
  }
  yield -1;
}
