import 'package:dart_secure/dart_secure.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // In-App Encryption Example
  final encryptedAddress =
      inAppEncrypt(text: "User's Address", key: "MyUsersAddress");

  // Hash Encryption Example
  final hashedAddress =
      hashEncrypt(plainText: "User's Address", keyIV: "MySaltKey1234567");

  // In-App Decryption Example
  final decryptedAddress =
      inAppDecrypt(cipherText: encryptedAddress, key: "MyUsersAddress");

  // Symmetric Encryption Example
  final symmetricallyEncrypted =
      symmetricEncrypt(text: "Sensitive Data", keyIV: "1234567890123456");

  // Symmetric Decryption Example
  final symmetricallyDecrypted = symmetricDecryption(
      cipherText: symmetricallyEncrypted, key: "1234567890123456");

  debugPrint("Encrypted Address: $encryptedAddress");
  debugPrint("Hashed Address: $hashedAddress");
  debugPrint("Decrypted Address: $decryptedAddress");
  debugPrint("Symmetrically Encrypted: $symmetricallyEncrypted");
  debugPrint("Symmetrically Decrypted: $symmetricallyDecrypted");

  runApp(const DartSecureExampleApp());
}

class DartSecureExampleApp extends StatelessWidget {
  const DartSecureExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Secure Example',
      home: userAuthMonitor(
        authenticatedUserPage: const HomePage(),
        unAuthenticatedUserPage: const LoginPage(),
        adminUID: 'your_admin_uid_here',
        adminPage: const AdminPage(),
        blockUID: const ['blocked_user_uid_1', 'blocked_user_uid_2'],
        userBlockedPage: const UserBlockedPage(),
      ),
    );
  }
}

// ─── Placeholder pages ───────────────────────────────────────────────────────

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Home Page')));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Login Page')));
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Admin Page')));
}

class UserBlockedPage extends StatelessWidget {
  const UserBlockedPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Blocked Page')));
}

// ─── Biometric example ───────────────────────────────────────────────────────

Future<void> getBiometric() async {
  final authStatus = await biometricAuth();
  if (authStatus == AuthenticationStatus.successful) {
    debugPrint('Authentication successful, continue');
  } else {
    debugPrint('Authentication unsuccessful, try again');
  }
}

// ─── Temp lock example ───────────────────────────────────────────────────────

Future<void> tempLockThisUser(BuildContext context) async {
  // Simulate a failed login attempt – lock the user for 30 seconds
  await tempLockUser(context, afterCountNavigateTo: const LoginPage());
}
