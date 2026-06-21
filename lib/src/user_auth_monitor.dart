import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget userAuthMonitor({
  /// If the user is authenticated what page should he see Ex. Home page
  required Widget authenticatedUserPage,

  /// If the user is suddenly got unauthenticated and the connection became insecure what page should he see Ex. Login page to Relogin
  required Widget unAuthenticatedUserPage,
  String? adminUID,
  Widget? adminPage,

  /// A list of blocked users ID that you dont want them to access the app
  List<String>? blockUID,

  /// The page that the blocked users should see Ex. No Access page
  Widget? userBlockedPage,
}) =>
    CheckFirebaseAuthentication(
      adminPage: adminPage,
      adminUID: adminUID,
      blockUID: blockUID,
      userBlockedPage: userBlockedPage,
      authenticatedUserPage: authenticatedUserPage,
      unAuthenticatedUserPage: unAuthenticatedUserPage,
    );

/// Widget that monitors Firebase Authentication state and displays pages conditionally.
class CheckFirebaseAuthentication extends StatefulWidget {
  final String? adminUID;
  final Widget? adminPage;

  /// A list of blocked users ID that you dont want them to access the app
  final List<String>? blockUID;

  /// The page that the blocked users should see Ex. No Access page
  final Widget? userBlockedPage;

  /// If the user is authenticated what page should he see Ex. Home page
  final Widget authenticatedUserPage;

  /// If the user is suddenly got unauthenticated and the connection became insecure what page should he see Ex. Login page to Relogin
  final Widget unAuthenticatedUserPage;

  const CheckFirebaseAuthentication({
    super.key,
    this.adminUID,
    this.adminPage,
    this.blockUID,
    required this.authenticatedUserPage,
    required this.unAuthenticatedUserPage,
    this.userBlockedPage,
  });

  @override
  State<CheckFirebaseAuthentication> createState() =>
      _FirebaseAuthenticationState();
}

class _FirebaseAuthenticationState extends State<CheckFirebaseAuthentication> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final user = snapshot.data;
            if (user != null) {
              if (widget.adminPage != null && user.uid == widget.adminUID) {
                return widget.adminPage!;
              } else if (widget.blockUID != null &&
                  widget.blockUID!.contains(user.uid)) {
                return widget.userBlockedPage ??
                    const Text("You are blocked!");
              }
              return widget.authenticatedUserPage;
            }
            return widget.unAuthenticatedUserPage;
          },
        ),
      ),
    );
  }
}
