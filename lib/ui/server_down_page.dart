import 'package:flutter/material.dart';

class ServerDownPage extends StatelessWidget {
  const ServerDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Status'),
        automaticallyImplyLeading: false, // Prevent back button
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_off,
                color: Colors.red,
                size: 100,
              ),
              SizedBox(height: 30),
              Text(
                'App Server is Down',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We are currently experiencing issues connecting to the server. Please contact your administrator to unblock access or try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 40),
              // ElevatedButton(

              //   onPressed: () {
              //     // TODO: Implement retry logic or navigate to a different screen
              //     // For now, we can just print a message.
              //     print('Contact Admin button pressed');
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blueAccent,
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   child: const Text(
              //     'Contact Administrator',
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
