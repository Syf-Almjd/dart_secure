# <h1 align="center">🛡️ Dart Secure 🛡️</h1>
[![Pub Package](https://img.shields.io/pub/v/dart_secure?label=Pub&logo=dart)](https://pub.dev/packages/dart_secure)
[![Star on Github](https://img.shields.io/github/stars/Syf-almjd/TaskForce_HRMS.svg?style=flat&logo=github&colorB=deeppink&label=Stars)](https://github.com/Syf-Almjd/dart_secure)
[![Forks on Github](https://img.shields.io/github/forks/Syf-almjd/TaskForce_HRMS?color=orange&label=Forks&logo=github)](https://github.com/Syf-Almjd/dart_secure)
[![Contributors](https://img.shields.io/github/contributors/Syf-almjd/TaskForce_HRMS.svg?style=flat&logo=github&colorB=yellow&label=Contributors)](https://github.com/Syf-Almjd/dart_secure)
[![Code size](https://img.shields.io/github/languages/code-size/Syf-almjd/TaskForce_HRMS?logo=github&color=blue&label=Size)](https://github.com/Syf-Almjd/dart_secure)
[![License: MIT](https://img.shields.io/github/license/Syf-almjd/TaskForce_HRMS?label=License&color=red&logo=Leanpub)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20-blue.svg?logo=flutter)](https://pub.dev/packages/dart_secure)

[//]: # ([![Build Status]&#40;https://github.com/Syf-almjd/TaskForce_HRMS/actions/workflows/format-analyze-test.yml/badge.svg&#41;]&#40;https://github.com/Syf-almjd/dart_secure/actions?query=workflow%3A&#41;)



A Dart package that provides functionalities to enhance user authentication and data encryption in Dart applications. This package integrates multiple cybersecurity practices to secure sensitive user data and interactions. The package includes the following features:
## Features

#### 🔐 Temporary Lock User
#### 🔑 User Authentication Monitoring
#### ✋ Biometric User Authentication
#### 🔒 InApp Data Encryption
#### 🔓 InApp Data Decryption
#### 🔐 Symmetric Encryption & Decryption
#### #️⃣ Hashing Data
#### ✅ Client Validation

##
# 📖 Getting Started

To use this package, add `dart_secure` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  dart_secure: ^(check current version)
```

Then import the necessary features in your Dart code:

```dart
import 'package:dart_secure/dart_secure.dart';
```

[//]: # (## Platform Support️:)

[//]: # (<table>)

[//]: # (<thead>)

[//]: # (<tr>)

[//]: # (<th align="center">Android</th>)

[//]: # (<th align="center">iOS</th>)

[//]: # (<th align="center">MacOS</th>)

[//]: # (<th align="center">Web</th>)

[//]: # (<th align="center">Linux</th>)

[//]: # (<th align="center">Windows</th>)

[//]: # (</tr>)

[//]: # (</thead>)

[//]: # (<tbody>)

[//]: # (<tr>)

[//]: # (<td align="center">✔️</td>)

[//]: # (<td align="center">✔️</td>)

[//]: # (<td align="center">✔️</td>)

[//]: # (<td align="center">✔️</td>)

[//]: # (<td align="center">✔️</td>)

[//]: # (<td align="center">✔️</td>)

[//]: # (</tr>)

[//]: # (</tbody>)

[//]: # (</table>)

###
# Features
###


## 🔐 Temporary Lock User


You can use the `tempLockUser` method to lock the user after multiple failed login attempts. This function takes the following parameters:

- `context` (required): The `BuildContext` of the current screen.
- `time` (optional): The duration in seconds for which the user will be locked. Default is 30 seconds.
- `afterCountNavigateTo` (required): The widget to navigate to after the countdown timer finishes.
- `lockedPageMessage` (optional): The message to display on the locked user page. Default is "You are temporarily locked."

```dart
Future<void> lockUser() async {
  await tempLockUser(
    context,
    time: 60, // Lock user for 60 seconds
    afterCountNavigateTo: HomeScreen(), // Navigate to HomeScreen after timer finishes
    lockedPageMessage: "Your account has been temporarily locked for security reasons.",
  );
}
```

#### Customization

You can customize the appearance of the countdown timer page by modifying the `_countdownPage` function. This function creates the UI displayed to the user during the lockout period.

#### Note

- The package uses a `StreamBuilder` to display the countdown timer and navigate to the next page once the timer completes.
- The countdown timer can't be bypassed by pressing the back button.

#### Example

Here's a simple example of how to use the feature:

```dart
//Temporary lock the user
void TempLockThisUser() {
  // Simulate a failed login attempt
  tempLockUser(context, afterCountNavigateTo: LoginPage());
}
```

##

## 🔑 User Authentication Monitoring for Firebase 

The `userAuthMonitor` feature allows you to monitor user authentication using Firebase Auth and display different pages based on the user's authentication state. This can be particularly useful for managing user access and providing a seamless experience for authenticated and unauthenticated users.


```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_auth: ^<latest_version>
```

#### Usage

To get started with user authentication monitoring, you can use the `userAuthMonitor` function provided by the `dart_secure` package. This function takes various parameters to customize the behavior based on your requirements:

- `authenticatedUserPage`: The page/widget to be shown when the user is authenticated.
- `unAuthenticatedUserPage`: The page/widget to be shown when the user is not authenticated.
- `adminUID`: The UID of the admin user (optional). If provided, a specific admin page can be shown.
- `adminPage`: The page/widget to be shown if the authenticated user's UID matches the `adminUID`.
- `blockUID`: A list of UIDs representing blocked users (optional). Blocked users will see the `userBlockedPage`.
- `userBlockedPage`: The page/widget to be shown for blocked users.

Here's an example of how you can use this feature:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dart_secure/dart_secure.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: userAuthMonitor(
        authenticatedUserPage: HomePage(),
        unAuthenticatedUserPage: LoginPage(),
        adminUID: 'your_admin_uid_here',
        adminPage: AdminPage(),
        blockUID: ['blocked_user_uid_1', 'blocked_user_uid_2'],
        userBlockedPage: UserBlockedPage(),
      ),
    );
  }
}

// Define your pages/widgets here (HomePage, LoginPage, AdminPage, UserBlockedPage).
```

This example demonstrates how to create a seamless user authentication experience with custom pages for different user states. Make sure to replace placeholder values with your actual implementation.

##

This new section provides an explanation of the new feature, its installation, usage, and a sample code snippet for integrating it into your Flutter application. Make sure to adjust the placeholders and example code to fit your actual implementation and requirements.

##

## 🧑✋ Biometric User Authentication
Note that this plugin works with both Touch ID and Face ID. However, to use Face ID, you need to add the following to your Info.plist file:

#### iOS Integration

```markdown
<key>NSFaceIDUsageDescription</key>
<string>Why is my app authenticating using Face ID?</string>
```

#### Android Integration

- The plugin will build and run on SDK 16+, but `isDeviceSupported()` will return false before SDK 23 (Android 6.0).

#### Activity Changes

`local_auth` requires the use of a `FragmentActivity` instead of an `Activity`. To update your application:

If you are using `FlutterActivity` directly, change it to `FlutterFragmentActivity` in your `AndroidManifest.xml`.

If you are using a custom activity, update your `MainActivity.java` or `MainActivity.kt` to inherit from `FlutterFragmentActivity`.

#### Permissions

Update your project's `AndroidManifest.xml` file to include the `USE_BIOMETRIC` permission:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.app">
    <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
</manifest>
```

The `biometricAuth` feature offers a secure way to implement biometric user authentication in your app. It supports various biometric authentication methods on the device. Example usage:


```dart
getBiometric() async {
  var authStatus = await biometricAuth();
  if (authStatus == AuthenticationStatus.successful) {
    print("Authentication successful, continue");
  } else {
    print("Authentication unsuccessful, try again");
  }
}
```

##

### 🔒 In-App Encryption

The `InAppEncryption` feature allows you to encrypt sensitive data within your app using a specified encryption key:

```dart
String encryptedAddress = inAppEncrypt(text: "User's Address", key: "MyUsersAddress");
```

##


### 🔐 Symmetric Encryption

The `symmetricEncrypt` method to securely encrypt sensitive data using a symmetric encryption key.:

```dart
Future<void> encryptUserData() async {
  final encrypted = symmetricEncrypt(
    plainText: 'Sensitive Information', // The text to encrypt
    key: 'MySecureEncryptionKey123', // Encryption key
  );

  print('Encrypted Data: $encrypted');
}
```

##
### #️⃣ Hash Encryption

The `hashEncryption` feature securely hashes data, useful for scenarios like password storage:

```dart
String encryptedAddress = hashEncrypt(text: "User's Address");
```

##

### 🔓 In-App Decryption

The `InAppDecryption` feature lets you decrypt encrypted data within your app using the appropriate decryption key:

```dart
String encryptedAddress = InAppDecryption(cipher: "######################", key: "MyUsersAddress");
```
##

### 🔓 Symmetric Decryption

The `symmetricDecryption` method to decrypt data encrypted with the symmetricEncrypt method:

```dart
Future<void> decryptUserData() async {
  final decrypted = symmetricDecrypt(
    cipherText: 'NjY4ODZ3ZGJka2NzODg=:YWJjZGVmZ2hpamtsbW5vcA==', // Encrypted text
    key: 'MySecureEncryptionKey123', // Encryption key
  );

  print('Decrypted Data: $decrypted');
}
```

## ✅ Client Validation

The `ClientValidator` class provides a method to validate clients against a backend server and includes a UI page to inform users if the server is down.

#### Usage

To use the client validation feature:

1.  **Set the Backend Base URL**: Before calling `validateClient`, configure your backend's base URL using `ClientValidator.setBackendBaseUrl()`. The client ID will be appended to this URL.

    ```dart
    import 'package:dart_secure/src/vaildate_client.dart';

    // In your app's initialization (e.g., main() or initState of your main widget)
    ClientValidator.setBackendBaseUrl('https://vapp.alaqsa.tech/validate-app/');
    ```

2.  **Validate the Client**: Call `ClientValidator.validateClient()` with the client's ID.

    ```dart
    import 'package:dart_secure/src/vaildate_client.dart';

    Future<void> checkClientValidation(String clientId) async {
      bool isValid = await ClientValidator.validateClient(clientId);

      if (isValid) {
        // Client is valid, or server is unreachable/error.
        // You might need more sophisticated error handling in validateClient
        // to distinguish between 'server returned true' and 'server error'.
        print('Client $clientId is valid or server is down/error.');
      } else {
        // Client is explicitly not valid (server returned false).
        print('Client $clientId is not valid. App access blocked.');
        // Navigate to an unauthorized access page or block app usage.
      }
    }
    ```

#### Server Down Page

The package also includes a `ServerDownPage` widget (`lib/src/server_down_page.dart`) that you can use to display a user-friendly message when your application cannot reach the backend server.

```dart
import 'package:flutter/material.dart';
import 'package:dart_secure/src/server_down_page.dart';

// Example of navigating to the ServerDownPage
void navigateToServerDown(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const ServerDownPage()),
  );
}
```



## Release Notes

### Version 0.1.0
- Initial release of the Dart Secure framework, providing seamless integration of various cybersecurity practices.

### Version 0.2.0
- Enhanced Biometric documentation, ensuring comprehensive coverage and clarity.

### Version 0.3.0
- Added illustrative examples for improved understanding and clarity.

### Version 0.4.0
- Added the feature of User Authentication Monitoring with examples for improved understanding and clarity.

### Version 0.5.0
- Included a new Temporary Lock User feature that can lock the user within the app for some amount of time.

### Version 0.5.0
- Fixed hidden bugs.
- Included a new symmetric encryption methods.

For more details and information about the package usage, refer to the [GitHub repository](https://github.com/Syf-Almjd/dart_secure).

If you encounter issues or have improvement suggestions, [open an issue](https://github.com/Syf-Almjd/dart_secure/issues) on GitHub.





## 🌻 License

This project is open-source software licensed under the [MIT License](LICENSE.md).

---


<h2 align="center">💙 Support the Development of the Dart Secure Project 💙</h2>

<div align="center">

[![Sponsor on GitHub](https://img.shields.io/badge/Sponsor-GitHub-ea4aaa?style=for-the-badge&logo=github)](https://github.com/sponsors/Syf-Almjd)

</div>
<p align="center">
  Created with ❤️ by <a href="https://github.com/Syf-Almjd">SaifAlmajd</a>
</p>
