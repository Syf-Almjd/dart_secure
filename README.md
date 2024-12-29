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


<h2 align="center">💙 Support Dart Security OS Development 💙</h2>

[//]: # ([![PayPal]&#40;https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/1200px-PayPal.svg.png&#41;]&#40;https://paypal.me/saifalmajdalmassri?country.x=MY&locale.x=en_US&#41;)


<div align="center">

[![Buy Me A Coffee](https://user-images.githubusercontent.com/26390946/161375563-69c634fd-89d2-45ac-addd-931b03996b34.png)](https://www.buymeacoffee.com/saifalmajdalmassri)
[![Ko-fi](https://user-images.githubusercontent.com/26390946/161375565-e7d64410-bbcf-4a28-896b-7514e106478e.png)](https://ko-fi.com/saifalmajdalmassri)

</div>



# <h2 align="center">👨‍💻 Framework Developer Profile 👨‍💻</h2>
<h1 align="center">Hi 👋, I'm Saif Almajd</h1>
<p align="center"> <img src="https://komarev.com/ghpvc/?username=syf-almjd&label=Profile%20views&color=0eb48b" alt="syf-almjd" /> </p>
<h3 align="center">Passionate of Full Stack Mobile/Web Development</h3>
<p align="center"> <a href="https://instagram.com/saif_almajd" target="blank"><img src="https://img.shields.io/twitter/follow/SaifAlmajd?logo=instagram&style=for-the-badge" alt="saif_almajd" /></a> <a href="https://github.com/Syf-Almjd" target="blank"><img src="https://img.shields.io/twitter/follow/Syf-Almjd?logo=github&style=for-the-badge" alt="saif_almajd" /></a> <a href="https://www.linkedin.com/in/saif-almajd/" target="blank"><img src="https://img.shields.io/twitter/follow/SaifAlmajd?logo=linkedin&style=for-the-badge" alt="saif_almajd" /></a> <a href="https://twitter.com/hsaifalmajd" target="blank"><img src="https://img.shields.io/twitter/follow/hsaifalmajd?logo=twitter&style=for-the-badge" alt="hsaifalmajd" /></a>
<a href="https://pub.dev/publishers/saifalmajd.blogspot.com/packages" target="blank"><img src="https://img.shields.io/twitter/follow/saifalmajd?logo=dart&style=for-the-badge" alt="saifalmajd" /></a>
</p>




<p align="center"> <img src="https://github-readme-stats.vercel.app/api?username=syf-almjd&show_icons=true&hide_border=true&locale=en" alt="syf-almjd"/></img><img src="https://github-readme-stats.vercel.app/api/top-langs?username=syf-almjd&show_icons=true&hide_border=true&locale=en&layout=compact" alt="syf-almjd"/></img>  </p>



<h3 align="center">Favoutre Languages and Tools:</h3>
<p align="center"> <a href="https://developer.android.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/android/android-original-wordmark.svg" alt="android" width="40" height="40"/> </a> <a href="https://dart.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/dartlang/dartlang-icon.svg" alt="dart" width="40" height="40"/> </a> <a href="https://www.figma.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/figma/figma-icon.svg" alt="figma" width="40" height="40"/> </a> <a href="https://firebase.google.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/firebase/firebase-icon.svg" alt="firebase" width="40" height="40"/> </a> <a href="https://flutter.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg" alt="flutter" width="40" height="40"/>  </a> </p>




- 🔭 I’m currently working on a [Dart Secure Security Framework](https://github.com/Syf-Almjd/dart_secure)

- 🌱 I’m currently learning **Springboot, Dart Servers**

- 👨‍💻 All of my projects are available at [SaifAlmajd.web.app/](https://saifalmajd.web.app/)

- 💬 Ask me about **Flutter, Java, Data Structure & Algorithms**

- 📫 How to reach me **syfalmjd11@gmail.com**

- ⚡ Fun fact **I am an AspireX Leadership Alumni :)**

<h1></h1>

<p></p>

I proudly embrace my roles as a Developer, Leader, and Believer in our shared journey toward a better humanity 🌎.

👨🏻‍💻 As a committed computer science professional and visionary leader, my mission is to harness the potential of technology to uplift humanity and leave a positive imprint on our world. In my capacity as the Manager of MJD Foundation, my focus is unwavering – I endeavor to craft ingenious tools that enhance and simplify the lives of everyone.

## 🔧 Expertise

- 💼 **Mobile Development**: Passionately expanding my expertise in mobile development to create user-friendly and innovative solutions.

- 🔒 **Cybersecurity**: Committed to ensuring the safety and security of digital landscapes in an increasingly connected world.
- 🚀 **Project Management and Leadership**: Proficiently orchestrating projects from inception to completion, optimizing resources, and leading cross-functional teams to deliver successful outcomes.

## 🌱 Continuous Learning

My unwavering belief in the power of continuous learning drives me to stay at the forefront of the latest advancements in the field.

## 💪 Versatility

With a background as a seasoned software engineer, I possess the versatility to navigate diverse platforms and excel in both written and verbal communication. My precision-oriented approach enables me to demystify intricate software challenges into easily digestible concepts.

## 🤝 Collaboration

I am actively seeking collaborative opportunities in the domains of Flutter, Dart, Cybersecurity, and Mobile Development. If you share my enthusiasm for creating groundbreaking solutions, please don't hesitate to reach out to me at [syfalmjd11@gmail.com](mailto:syfalmjd11@gmail.com).

Let's join forces and shape technology into a more human-centric and empowering force for our global community! 🌎

<h3 align="center">Connect with Me:</h3>
<p align="center">
<!-- <a href="https://dev.to/https://dev.to/saifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/devto.svg" alt="https://dev.to/saifalmajd" height="30" width="40" /></a> -->
<a href="https://twitter.com/hsaifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="hsaifalmajd" height="30" width="40" /></a>
<a href="https://linkedin.com/in/saif-almajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="saif-almajd" height="30" width="40" /></a>
<a href="https://stackoverflow.com/users/19370215" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/stack-overflow.svg" alt="19370215" height="30" width="40" /></a>
<a href="https://instagram.com/saif_almajd/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/instagram.svg" alt="saif_almajd/" height="30" width="40" /></a>
<a href="https://dribbble.com/saifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/dribbble.svg" alt="saifalmajd" height="30" width="40" /></a>
<a href="https://hashnode.com/@saifalmajd" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/hashnode.svg" alt="@saifalmajd" height="30" width="40" /></a>
<a href="https://auth.geeksforgeeks.org/user/syfalm4h6f" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/geeks-for-geeks.svg" alt="syfalm4h6f" height="30" width="40" /></a>
<a href="/https://github.com/syf-almjd.atom" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/rss.svg" alt="https://github.com/syf-almjd.atom" height="30" width="40" /></a>
</p>


<h3 align="center">Support:</h3>
<p align="center"> <a href="https://www.buymeacoffee.com/saifalmajdalmassri"> <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="https://www.buymeacoffee.com/saifalmajdalmassri" /></a><a href="https://ko-fi.com/saifalmajdalmassri"> &nbsp; <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="https://ko-fi.com/saifalmajdalmassri" /></a></p><br><br>