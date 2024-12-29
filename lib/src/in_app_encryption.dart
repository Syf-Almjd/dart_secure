import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:convert';

/// Encrypts the given [text] using the provided [key]. The [key] must be 32 characters or less.
/// If the [key] is shorter than 32 characters, it will be padded with `#`.
/// Returns a base64-encoded string of the encrypted text.
String inAppEncrypt({required String text, required String key}) {
  return _inAppEncryption(text, key);
}

/// Encrypts the given [text] using the provided [keyIV] for Salsa20 encryption.
/// Note: This is not a hashing method and is reversible.
String symmetricEncrypt({required String text, required String keyIV}) {
  return _symmetricEncryption(text, keyIV);
}

/// Hashes the given [plainText] with a salt ([keyIV]) using SHA-256.
String hashEncrypt({required String plainText, required String keyIV}) {
  return _hashEncryption(plainText, keyIV);
}

String _inAppEncryption(String plainText, String ptKey) {
  if (ptKey.length > 32) {
    throw ArgumentError('Key must be 32 characters or fewer.');
  }
  ptKey = ptKey.padRight(32, '#');
  final keyBytes = Key.fromUtf8(ptKey);
  final iv = IV.fromSecureRandom(16); // Random IV for better security
  final encrypter = Encrypter(AES(keyBytes));
  final encrypted = encrypter.encrypt(plainText, iv: iv);
  return '${encrypted.base64}:${iv.base64}'; // Store IV with ciphertext
}

String _symmetricEncryption(String plainText, String keyIV) {
  if (keyIV.length != 16) {
    throw ArgumentError('keyIV must be exactly 16 characters.');
  }
  final key = Key.fromUtf8('wctdg4SXTIFvvGreJ91OQLkQRNqE99I6');
  final iv = IV.fromUtf8(keyIV);
  final encrypter = Encrypter(Salsa20(key));
  final encrypted = encrypter.encrypt(plainText, iv: iv);
  return encrypted.base64;
}

String _hashEncryption(String plainText, String keyIV) {
  final bytes = utf8.encode(plainText + keyIV); // Combine text with salt
  final hashed = sha256.convert(bytes); // Hash the combination
  return hashed.toString(); // Return hash as a hexadecimal string
}
