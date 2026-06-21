import 'dart:convert';
import 'package:encrypt/encrypt.dart';

/// Decrypts the given [cipherText] using the provided [key].
/// The [key] must be 32 characters or less.
/// The [cipherText] should include both the encrypted data and the IV (separated by `:`).
String inAppDecrypt({required String cipherText, required String key}) {
  return _decryptAES(cipherText, key);
}

/// Decrypts the given [cipherText] using the provided [key] (which was the 16-character `keyIV` in encryption).
/// Note: This is Salsa20 decryption using the same key/IV as `symmetricEncrypt`.
String symmetricDecryption({required String cipherText, required String key}) {
  return _decryptSalsa20(cipherText, key);
}

String _decryptAES(String cipherText, String ptKey) {
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

String _decryptSalsa20(String cipherText, String keyIV) {
  if (keyIV.length != 16) {
    throw ArgumentError('keyIV (or key) must be exactly 16 characters.');
  }
  final key = Key.fromUtf8('wctdg4SXTIFvvGreJ91OQLkQRNqE99I6');
  final iv = IV.fromUtf8(keyIV.substring(0, 8)); // Salsa20 requires an 8-byte IV
  final encrypter = Encrypter(Salsa20(key));
  try {
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(cipherText), iv: iv);
    return decrypted;
  } catch (e) {
    throw ArgumentError(
        'Decryption failed. Please check your key/IV and ciphertext.');
  }
}
