import 'package:flutter/material.dart';

///You can use this for locking down the user after multiple login attempt to prevent against DOS and BruteForce
Future<void> tempLockUser(BuildContext context,

    ///Time in seconds
    {int time = 30,

    ///The widget that you want the timer to navigate to after timer is finished.
    required Widget afterCountNavigateTo,

    ///The message you want to display in the locked user page;
    String lockedPageMessage = "You are temporary locked"}) async {
  await Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext ctx) => _CountdownPage(
          time: time,
          message: lockedPageMessage,
          nextPage: afterCountNavigateTo),
    ),
  );
}

class _CountdownPage extends StatefulWidget {
  final int time;
  final String message;
  final Widget nextPage;

  const _CountdownPage({
    required this.time,
    required this.message,
    required this.nextPage,
  });

  @override
  State<_CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<_CountdownPage> {
  bool _navigated = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: StreamBuilder<int>(
            stream: _countdownStream(widget.time),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == 0) {
                  if (!_navigated) {
                    _navigated = true;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => widget.nextPage),
                      );
                    });
                  }
                  return const CircularProgressIndicator();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.message),
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
    );
  }
}

Stream<int> _countdownStream(int time) async* {
  var counter = time;
  yield counter;
  while (counter > 0) {
    await Future.delayed(const Duration(seconds: 1));
    counter--;
    yield counter;
  }
}
