import 'dart:convert';
import 'package:encrypt/encrypt.dart';

/// Decrypts the given [cipherText] using the provided [key].
/// The [key] must be 32 characters or less.
/// The [cipherText] should include both the encrypted data and the IV (separated by `:`).
String inAppDecrypt({required String cipherText, required String key}) {
  return _inAppDecryption(cipherText, key);
}

/// Decrypts the given [cipherText] using the provided [key].
/// The [cipherText] should include both the encrypted data and the IV (separated by `:`).
String symmetricDecryption({required String cipherText, required String key}) {
  return _decrypt(cipherText, key);
}

String _decrypt(String cipherText, String ptKey) {
  // Validate the key length
  if (ptKey.length > 32) {
    throw ArgumentError('Key must be 32 characters or fewer.');
  }

  // Pad the key to 32 characters if necessary
  ptKey = ptKey.padRight(32, '#');
  final keyBytes = Key.fromUtf8(ptKey);

  // Split the ciphertext into encrypted data and IV
  final parts = cipherText.split(':');
  if (parts.length != 2) {
    throw ArgumentError(
        'Invalid cipherText format. Expected "encryptedData:iv".');
  }

  final encryptedData = parts[0];
  final ivData = parts[1];

  // Decode the Base64-encoded data
  final encryptedBytes = base64Decode(encryptedData);
  final ivBytes = base64Decode(ivData);
  final iv = IV(ivBytes);

  // Initialize the encrypter
  final encrypter = Encrypter(AES(keyBytes));

  // Decrypt the data
  try {
    final decrypted = encrypter.decrypt(Encrypted(encryptedBytes), iv: iv);
    return decrypted;
  } catch (e) {
    throw ArgumentError(
        'Decryption failed. Please check your key and ciphertext.');
  }
}

String _inAppDecryption(String cipherText, String ptKey) {
  // Validate the key length
  if (ptKey.length > 32) {
    throw ArgumentError('Key must be 32 characters or fewer.');
  }

  // Pad the key to 32 characters if necessary
  ptKey = ptKey.padRight(32, '#');
  final keyBytes = Key.fromUtf8(ptKey);

  // Split the ciphertext into encrypted data and IV
  final parts = cipherText.split(':');
  if (parts.length != 2) {
    throw ArgumentError(
        'Invalid cipherText format. Expected "encryptedData:iv".');
  }

  final encryptedData = parts[0];
  final ivData = parts[1];

  // Decode the Base64-encoded data
  final encryptedBytes = base64Decode(encryptedData);
  final ivBytes = base64Decode(ivData);
  final iv = IV(ivBytes);

  // Initialize the encrypter
  final encrypter = Encrypter(AES(keyBytes));

  // Decrypt the data
  try {
    final decrypted = encrypter.decrypt(Encrypted(encryptedBytes), iv: iv);
    return decrypted;
  } catch (e) {
    throw ArgumentError(
        'Decryption failed. Please check your key and ciphertext.');
  }
}
