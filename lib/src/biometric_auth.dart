import 'package:local_auth/local_auth.dart';

final LocalAuthentication auth = LocalAuthentication();

///Biometric User Authentication
///
///Sample of Usage:
///                          var AuthStatus= await biometricAuth();
///                          if (AuthStatus==AuthenticationStatus.successful){
///                             print("successful, continue");
///                           }
///                           else {
///                             print("unsuccessful, try again");
///                           }
///

Future<AuthenticationStatus> biometricAuth({
  BiometricAuthType? biometricAuthType,
  bool biometricOnly = false,
  bool stickyAuth = false,
  bool sensitiveTransaction = false,
  @Deprecated('This option is no longer supported by local_auth 3.0.0 and will be ignored.')
  bool userErrorDialogs = false,
  String message = "Authentication",
}) {
  if (biometricAuthType != null) {
    return _checkSpecificBioAuth(
      biometricAuthType,
      biometricOnly,
      stickyAuth,
      sensitiveTransaction,
      message,
    );
  }
  return _checkBioAuth(
    biometricOnly,
    stickyAuth,
    sensitiveTransaction,
    message,
  );
}

enum AuthenticationStatus {
  successful,
  failed,
  noBiometricAvailable;
}

///You can choose if you want to have a specific type of Biometric Authentication, some devices only show Strong and weak so it is highly recommended to choose Strong for better device adaption
enum BiometricAuthType {
  /// Face authentication.
  face,

  /// Fingerprint authentication.
  fingerprint,

  /// Iris authentication.
  iris,

  /// Any biometric (e.g. fingerprint, iris, or face) on the device that the
  /// platform API considers to be strong. For example, on Android this
  /// corresponds to Class 3.
  strong,

  /// Any biometric (e.g. fingerprint, iris, or face) on the device that the
  /// platform API considers to be weak. For example, on Android this
  /// corresponds to Class 2.
  weak,
}

Future<AuthenticationStatus> _checkBioAuth(
  bool userBiometricOnly,
  bool userStickyAuth,
  bool userSensitiveTransaction,
  String userMessage,
) async {
  final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();
  if (availableBiometrics.isNotEmpty) {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: userMessage,
        biometricOnly: userBiometricOnly,
        persistAcrossBackgrounding: userStickyAuth,
        sensitiveTransaction: userSensitiveTransaction,
      );
      return didAuthenticate
          ? AuthenticationStatus.successful
          : AuthenticationStatus.failed;
    } catch (e) {
      return AuthenticationStatus.failed;
    }
  }
  return AuthenticationStatus.noBiometricAvailable;
}

Future<AuthenticationStatus> _checkSpecificBioAuth(
  BiometricAuthType userSelection,
  bool userBiometricOnly,
  bool userStickyAuth,
  bool userSensitiveTransaction,
  String userMessage,
) async {
  final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();
  if (availableBiometrics
      .contains(BiometricType.values.byName(userSelection.name))) {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: userMessage,
        biometricOnly: userBiometricOnly,
        persistAcrossBackgrounding: userStickyAuth,
        sensitiveTransaction: userSensitiveTransaction,
      );
      return didAuthenticate
          ? AuthenticationStatus.successful
          : AuthenticationStatus.failed;
    } catch (e) {
      return AuthenticationStatus.failed;
    }
  }
  return AuthenticationStatus.noBiometricAvailable;
}
