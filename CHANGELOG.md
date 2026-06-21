## 1.5.0
- Fixed missing type annotations in `biometric_auth.dart` private helper functions.
- Replaced deprecated `WillPopScope` with `PopScope` in `temp_lock_user.dart`.
- Refactored `tempLockUser` into a proper `StatefulWidget` for correct navigation after countdown.
- Replaced `print()` calls with `debugPrint()` in `vaildate_client.dart` to satisfy `avoid_print` lint.
- Fixed all errors in `example/example.dart`: undefined identifiers, wrong API signatures, unused imports, and undefined page functions.
- Updated dependency constraints: `http ^1.6.0`, `local_auth ^2.3.0`, `encrypt ^5.0.3`, `flutter_lints ^4.0.0`.
- Updated README.md: corrected code examples with accurate function signatures and updated release notes.

## 0.6.5
- Fixed hidden bugs.
- Included new symmetric encryption methods (`symmetricEncrypt` / `symmetricDecryption`).

## 0.6.0
- Added `ClientValidator` class for backend client validation, including configurable base URL and `clientId` in URL path.
- Introduced `ServerDownPage` UI widget to inform users when the app server is down.

## 0.5.0
- Included a new Temporary Lock User feature that can lock the user within the app for some amount of time.

## 0.4.0
- Included the feature of User Authentication Monitoring with examples for improved understanding and clarity.

## 0.3.0
- Added illustrative examples for improved understanding and clarity.

## 0.2.0
- Enhanced Biometric documentation, ensuring comprehensive coverage and clarity.

## 0.1.0
- Initial release of the Dart Secure framework, providing seamless integration of various cybersecurity practices.
