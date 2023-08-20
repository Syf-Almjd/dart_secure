import 'package:dart_secure/dart_secure.dart';
import 'package:flutter/material.dart';


void main() async {

  //User Authentication Monitoring
  keepGettingAuthStatus();

  // Biometric User Authentication Example
  getBiometric();
  // In-App Encryption Example
  var encryptedAddress = inAppEncrypt(text: "User's Address", key: "MyUsersAddress");
  print("Encrypted Address: $encryptedAddress");

  // Hash Encryption Example
  var hashedAddress = hashEncrypt(text: "User's Address");
  print("Hashed Address: $hashedAddress");

  // In-App Decryption Example
  var decryptedAddress = inAppDecrypt(cipherText: encryptedAddress, key: "MyUsersAddress");
  print("Decrypted Address: $decryptedAddress");
}



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



void getBiometric() async {
  var authStatus = await biometricAuth();
  if (authStatus == AuthenticationStatus.successful) {
    print("Authentication successful, continue");
  } else {
    print("Authentication unsuccessful, try again");
  }
}
