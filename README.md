# Dart Secure Package

A Dart package that provides functionalities to enhance user authentication and data encryption in Dart applications. This package integrates multiple cybersecurity practices to secure sensitive user data and interactions. The package includes the following features:
## Features

#### Temporary Lock User
#### User Authentication Monitoring
#### Biometric User Authentication
#### InApp Data Encryption
#### InApp Data Decryption
#### Hashing Data

##
# Getting Started

To use this package, add `dart_secure` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  dart_secure: ^(check current version)
```

Then import the necessary features in your Dart code:

```dart
import 'package:dart_secure/dart_secure.dart';
```

###
# Features
###
### User Authentication Monitoring for Firebase 

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

### Biometric User Authentication

#### iOS Integration

Note that this plugin works with both Touch ID and Face ID. However, to use Face ID, you need to add the following to your Info.plist file:

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

### In-App Encryption

The `InAppEncryption` feature allows you to encrypt sensitive data within your app using a specified encryption key:

```dart
String encryptedAddress = inAppEncrypt(text: "User's Address", key: "MyUsersAddress");
```

### Hash Encryption

The `hashEncryption` feature securely hashes data, useful for scenarios like password storage:

```dart
String encryptedAddress = hashEncrypt(text: "User's Address");
```

### In-App Decryption

The `InAppDecryption` feature lets you decrypt encrypted data within your app using the appropriate decryption key:

```dart
String encryptedAddress = InAppDecryption(cipher: "######################", key: "MyUsersAddress");
```

### Temporary Lock User 


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


For more details and information about the package usage, refer to the [GitHub repository](https://github.com/Syf-Almjd/dart_secure).

If you encounter issues or have improvement suggestions, [open an issue](https://github.com/Syf-Almjd/dart_secure/issues) on GitHub.

Happy coding!
