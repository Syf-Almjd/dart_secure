import 'dart:ffi';

import 'package:dart_secure/dart_secure.dart';
import 'package:flutter/material.dart';

void main() async {
  //Example User Authentication Status
  //User Authentication Monitoring
  keepGettingAuthStatus();

  //Example User get Biometric
  // Biometric User Authentication Example
  getBiometric();

  //Example Lock the User
  if (attempt >= 3) {
    //Temporary lock current user
    TempLockThisUser();
  }

  // In-App Encryption Example
  var encryptedAddress =
      inAppEncrypt(text: "User's Address", key: "MyUsersAddress");
  print("Encrypted Address: $encryptedAddress");

  // Hash Encryption Example
  var hashedAddress = hashEncrypt(text: "User's Address");
  print("Hashed Address: $hashedAddress");

  // In-App Decryption Example
  var decryptedAddress =
      inAppDecrypt(cipherText: encryptedAddress, key: "MyUsersAddress");
  print("Decrypted Address: $decryptedAddress");
}

//Example User Authentication Status
//User Authentication Monitoring
Widget keepGettingAuthStatus() {
  return Scaffold(
    body: userAuthMonitor(
      authenticatedUserPage: HomePage(),
      unAuthenticatedUserPage: LoginPage(),
      adminUID: 'your_admin_uid_here',
      adminPage: AdminPage(),
      blockUID: ['blocked_user_uid_1', 'blocked_user_uid_2'],
      userBlockedPage: UserBlockedPage(),
    ),
  );
}

//Temporary lock the user
void TempLockThisUser() {
  // Simulate a failed login attempt
  tempLockUser(context, afterCountNavigateTo: LoginPage());
}

//Example User get Biometric
// Biometric User Authentication Example
void getBiometric() async {
  var authStatus = await biometricAuth();
  if (authStatus == AuthenticationStatus.successful) {
    print("Authentication successful, continue");
  } else {
    print("Authentication unsuccessful, try again");
  }
}
