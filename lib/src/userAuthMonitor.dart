import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

userAuthMonitor(
        {
        ///If the user is authenticated what page should he see Ex. Home page
        required Widget authenticatedUserPage,

        ///If the user is suddenly got unauthenticated and the connection became insure what page should he see Ex. Login page to Relogin
        required Widget unAuthenticatedUserPage,
        String? adminUID,
        Widget? adminPage,

        ///A list of blocked users ID that you dont want them to access the app
        List<String>? blockUID,

        ///The page that the blocked users should see Ex. No Accces page
        Widget? userBlockedPage}) =>
    _CheckFirebaseAuthentication(
        adminPage: adminPage,
        adminUID: adminUID,
        blockUID: blockUID,
        userBlockedPage: userBlockedPage,
        authenticatedUserPage: authenticatedUserPage,
        unAuthenticatedUserPage: unAuthenticatedUserPage);

class _CheckFirebaseAuthentication extends StatefulWidget {
  final String? adminUID;
  final Widget? adminPage;

  ///A list of blocked users ID that you dont want them to access the app
  final List<String>? blockUID;

  ///The page that the blocked users should see Ex. No Accces page
  final Widget? userBlockedPage;

  ///If the user is authenticated what page should he see Ex. Home page
  final Widget authenticatedUserPage;

  ///If the user is suddenly got unauthenticated and the connection became insure what page should he see Ex. Login page to Relogin
  final Widget unAuthenticatedUserPage;

  const _CheckFirebaseAuthentication(
      {this.adminUID,
      this.adminPage,
      this.blockUID,
      required this.authenticatedUserPage,
      required this.unAuthenticatedUserPage,
      this.userBlockedPage});

  @override
  State<_CheckFirebaseAuthentication> createState() =>
      _FirebaseAuthenticationState();
}

class _FirebaseAuthenticationState extends State<_CheckFirebaseAuthentication> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if ((widget.adminPage != null) &&
                    (FirebaseAuth.instance.currentUser!.uid ==
                        widget.adminUID)) {
                  return widget.adminPage ??
                      const Text(
                          "Error in Page Admin, to fix this contact the app developer");
                } else if ((widget.blockUID != null) &&
                    (widget.blockUID!
                        .contains(FirebaseAuth.instance.currentUser!.uid))) {
                  return widget.userBlockedPage ??
                      const Text("Your are blocked!");
                }
                return widget.authenticatedUserPage;
              }
              return widget.unAuthenticatedUserPage;
            }),
      ),
    );
  }
}
